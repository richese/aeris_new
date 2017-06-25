#!/usr/bin/env bash


pushd "$(dirname $0)" > /dev/null
pushd .. > /dev/null
export MAIN_ROOT_DIR="$(pwd)"
popd > /dev/null
popd > /dev/null
source ${MAIN_ROOT_DIR}/bin/bash-env.sh

POS="$MAIN_ROOT_DIR/data/training_positive"
NEG="$MAIN_ROOT_DIR/data/training_negative"
TEST="$MAIN_ROOT_DIR/data/training_test.txt"
TEST2="$MAIN_ROOT_DIR/data/training_test2.txt"
SVM="$MAIN_ROOT_DIR/data/model.xml"

rm -vf "${POS}.txt" "${POS}.xml" "${NEG}.txt" "${NEG}.xml" "${TEST}" "${TEST2}"


# Add paths to all png images from directories data/image/neg & data/image/neg/slices
# to one text file.
# Usage of MAIN_ROOT_DIR variable automatically means that paths are absolute.
for f in $MAIN_ROOT_DIR/data/image/neg/*.png $MAIN_ROOT_DIR/data/image/neg/slices/*.png; do
  echo "$f" >> $NEG.txt
  echo "0 $f" >> $TEST
done

# The same for positive samples
for f in $MAIN_ROOT_DIR/data/image/pos/*.png; do
  echo "$f" >> $POS.txt
  echo "1 $f" >> $TEST
done

# set files for SVM testing
for f in $MAIN_ROOT_DIR/data/image/test_neg/*; do
  echo "0 $f" >> $TEST2
done
for f in $MAIN_ROOT_DIR/data/image/test_pos/*; do
  echo "1 $f" >> $TEST2
done

echo "------------------------"
echo "Preparing training data:"
echo "------------------------"
$MAIN_BIN_DIR/svm-training.elf extract $POS.txt $POS.xml
$MAIN_BIN_DIR/svm-training.elf extract $NEG.txt $NEG.xml

echo "-------------"
echo "Training SVM:"
echo "-------------"
time $MAIN_BIN_DIR/svm-training.elf train $POS.xml $NEG.xml $SVM

echo "-------------"
echo "SVM selftest:"
echo "-------------"
$MAIN_BIN_DIR/svm-training.elf classify $SVM $TEST

echo "---------"
echo "SVM test:"
echo "---------"
$MAIN_BIN_DIR/svm-training.elf classify $SVM $TEST2
