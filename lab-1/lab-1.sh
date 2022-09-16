#!/bin/bash

CYAN='\033[0;36m'
NO_COLOR='\033[0m'

newLine() {
    echo $'\n'
}

echoLn() {
    echo -e "${CYAN}${1}${NO_COLOR}" $'\n'
}

logCd() {
    echo Changing directory with \"$1\" reffers to \"$(pwd)\"  $'\n'
}

echoLn "Lab 1"

ROOT_DIR=$(pwd)

echoLn "Our working directory is $(pwd)"

ls -ahl
newLine

cd ~
logCd '~'

cd -
logCd '-'

cd ../..
logCd '../..'

cd
logCd ''

cd .
logCd '.'

cd $ROOT_DIR
echoLn 'Returned to the root directory'

if [ ! -f file1.txt ]; then
    touch file1.txt
fi

echoLn 'Enter some phrases below to write into file1.txt'
cat > file1.txt

echo $(ls -h) > file2.txt
echoLn 'Root directory content has been written into file2.txt. See below'
cat file2.txt
newLine

for IDX in {1..2}; do
    cat file$IDX.txt >> file3.txt
done

echoLn 'file1.txt and file2.txt have been merged into file3.txt. See below'
cat file3.txt

for IDX in {1..3}; do
    mkdir dir$IDX
done

echoLn 'Directories dir[1..3] have been created. Now the directory has'
ls
newLine

cp file1.txt file4.txt
cp file1.txt file2.txt file3.txt file4.txt dir1
echoLn 'file4.txt got file1.txt text. All the files have been moved into dir1'
ls dir1
newLine

mv file[1-4].txt dir2
mv ./dir2/file2.txt ./dir2/abc.txt
echoLn 'All the files have been moved into dir2. Then file2.txt has been renamed as abc.txt'
ls dir2
newLine

echoLn 'Folder dir1 and dir2 were moved (with contents) to dir3'
cp -R dir1 dir2 dir3
ls dir3
newLine

rm -fv dir1/file[13].txt
rm -rfv dir[1-3]
echoLn 'Removed file1.txt and file3.txt form dir1. Then removed dir1, dir2, dir3'
ls
newLine

echoLn '<-- Working with user roles! -->'
echoLn 'Watching to id the current and the root user'

id
id root

touch text.txt
echo "Experientia est optima magistra." > text.txt
echoLn 'Createf text.txt and put the some text in'

cat text.txt
echoLn 'Permissions before'
ls -l
newLine

chmod u-r text.txt
echoLn 'Permissions after chmod u-r'

ls -l
newLine

chmod 642 text.txt
echoLn 'Permissions after chmod 642'
ls -l
newLine

echoLn '<-- Compiling the program! -->'

gcc $ROOT_DIR/lab_1.c -o lab_1 && echo 'Successfully compiled!' || echo 'Compilation failed!'

echoLn 'Running with current user'
./lab_1

echoLn 'Running with root user'
su -c ./lab_1

echoLn 'Done!'
