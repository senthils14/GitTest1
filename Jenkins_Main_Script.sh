#!/bin/bash
path="C:/Study/workspace"
source_path="C:/PROGRA~2/Jenkins/workspace/Validation_Job_Test"
OUTPUT=`git diff --oneline --name-status 35a4dd9e7634821d2bed32b24c7fe9a5b14bee9a HEAD | grep -v build | awk -F" " '{print $NF}'`
COUNT=`git diff --oneline --name-status 35a4dd9e7634821d2bed32b24c7fe9a5b14bee9a HEAD | wc -l`
echo $OUTPUT
for i in $OUTPUT
do
j=$i
components=`echo $i | awk -F"/" '{print $2}'`
cd $path
if [ ! -d "$components" ]; then
	mkdir $components
	cp $source_path/$i $path/$components	
else
	cp $source_path/$i $path/$components	
fi
echo $path
	
echo $j
done
cd $source_path
cp build.xml $path