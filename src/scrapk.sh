#!/bin/sh
shopt -s expand_aliases

apkFullPath=$1
echo $apkFullPath

apkPath="${apkFullPath%/*}"
echo $apkPath

apkFileExt="${apkFullPath##*/}"
echo $apkFileExt

apkFile="${apkFileExt%.*}"
echo $apkFile

##########################################################
zipFile="./"$apkFile".zip"
cp $apkFullPath $zipFile

unzip $zipFile -d ./$apkFile
rm -f $zipFile
cd ./$apkFile


lib_home=/usr/local/lib/scrapk
androidXmlFile=${lib_home}/axmlprinter/AXMLPrinter2.jar
dex2jarFile=${lib_home}/dex2jar/d2j-dex2jar.sh
jadFile=${lib_home}/jad/jad

# *****Parse AndroidManifest*********************
if [ -e $androidXmlFile ]; then
  alias androidXml="java -jar ${androidXmlFile}"
else
  echo "Not installed AXMLPrinter2.jar"
  exit
fi
androidXml AndroidManifest.xml > _AndroidManifest.xml

# *****dex to jar******************************
if [ -e $dex2jarFile ]; then
  alias dex2jar=${dex2jarFile}
else
  echo "Not installed dex2jar"
  exit
fi

dex2jar ./classes.dex

mkdir -m 775 ./source
mv ./classes-dex2jar.jar ./source
cd ./source
jar xvf classes-dex2jar.jar
rm -f ./classes-dex2jar.jar
cd ../

# *****.class to .java******************************
if [ -e $jadFile ]; then
  alias sh_jad=${jadFile}
else
  echo "Not installed jad"
  exit
fi
sh_jad -o -r -sjava -dsrc ./source/**/*.class

rm -fr ./source
rm -f ./AndroidManifest.xml
mv ./_AndroidManifest.xml ./AndroidManifest.xml

echo '******************************************************'
echo '********          Finished scrapk          ***********'
echo '******************************************************'
