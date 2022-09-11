#!/bin/bash

echo "Lab 1"

cdWithLog() {
    cd $1
    pwd
}

ROOT_DIR=$(pwd)

pwd
ls -ahl

PATHES=('~/' '-' '../..' '' '.')

for GO_TO in $PATHES; do
    cdWithLog $GO_TO
done

cd $ROOT_DIR

if [ ! -f file1.txt ]; then 
    touch file1.txt
fi

echo $'\nEnter some phrases below:\n'
cat > file1.txt

echo $(ls -h) > file2.txt
cat file2.txt

for IDX in {1..2}; do
    cat file$IDX.txt >> file3.txt
done

cat file3.txt

for IDX in {1..3}; do
    mkdir dir$IDX
done

ls

cp file1.txt file4.txt
cp file1.txt file2.txt file3.txt file4.txt dir1
ls dir1

mv file[1-4].txt dir2
mv file2.txt abc.txt
ls dir2

cp -R dir1 dir2 dir3
ls dir3

rm -fv dir1/file[13].txt

rm -rfv dir[1-3]
ls

