#!/usr/bin/env python3
# https://github.com/easylogging/easyloggingpp/issues/206
# Potrebuje python verzie aspon 3.4 a pythonacku kniznicu 'tabulate'

import sys
# if not sys.version_info[:2] == (3,4):
#     print("Error, I need python 3.4");
import re
import statistics
import getopt
from tabulate import tabulate # pip3 inst all tabulate!!

def main():
    # default parameters
    inputfile='htrack_performance.log'
    sortby=0

    # Parse command line options
    opts, args = getopt.getopt(sys.argv[1:],'hi:s:')
    for opt, arg in opts:
        if opt == '-h':
            print('Examples:')
            print('    parselog.py -i performance.log')
            print('    parselog.py -i performance.log -s 1')
            sys.exit(0)
        elif opt in ('-i', '--ifile'):
           inputfile = arg
        elif opt in ('-s', '--sort'):
           sortby = int(arg)

    # https://docs.python.org/2/howto/regex.html
    # \[ : [ is a meta char and needs to be escaped
    # (.*?) : match everything in a non-greedy way and capture it.
    expr = re.compile('\[(.*?)\]')

    data = dict()
    for line in open(inputfile, 'r'):
        # print '\n\n-----';
        strings = expr.findall(line)
        assert(len(strings)>1)
        if line.count('Executed'):
            if len(strings) == 3:
                key = strings[1];
                val = strings[2];
                vals = val.partition(' ')
                unit = vals[2]
            elif len(strings) == 4:
                key = strings[2] + ':' + strings[1];
                val = strings[3];
                vals = val.partition(' ')
                unit = vals[2]
        elif line.count('Performance checkpoint for block'):
            if len(strings) == 3:
                key = strings[1] + ' checkpoint'
                val = strings[2]
                vals = val.partition(' ')
                unit = vals[2]

        # brings everything on the same scale (ms)
        num_ms = float(vals[0])
        if unit=='mis':
            num_ms = num_ms/1000.0
        if unit=='seconds':
            num_ms = num_ms*1000.0

        # append time to dictionary entry
        if key in data:
            data[key].append(num_ms)
        else:
            data[key] = [num_ms]

    #--- to sort the data
    # import operator
    # for key in sorted(data, key=operator.itemgetter(0), reverse=True):

    #--- create the table
    table = [];
    for key in sorted(data):
        # compute statistics
        _med = statistics.median(data[key])
        _avg = statistics.mean(data[key])
        _max = max(data[key])
        table.append((key, _med, _avg, _max))

    #--- sort it
    table = sorted(table, key=lambda val: val[sortby], reverse=True)

    #--- create a pretty table
    header= ["Context","median (ms)", "mean(ms)","max(ms)"]
    header[sortby] = '**'+header[sortby]+'**'
    # print('Table sorted by: ', header[sortby])
    print( tabulate(table, headers=header, floatfmt=".2f") )

if __name__ == "__main__":
    main()
