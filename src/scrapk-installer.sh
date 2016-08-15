###############################################
# Author : Popbrain
# Update : 2016.08.15
###############################################
#!/bin/sh

cp ./scrapk /usr/local/bin

cd /usr/local
lib_home=/usr/local/lib/scrapk
# dex2jar version
dex2JarVer=2.0

mkdir -m 775 $lib_home
# Download dex2jar
cd ${lib_home}
wget https://github.com/pxb1988/dex2jar/releases/download/2.0/dex-tools-${dex2JarVer}.zip
unzip ./dex-tools-${dex2JarVer}.zip
rm -f dex-tools-${dex2JarVer}.zip
mv dex2jar-${dex2JarVer} dex2jar
chmod -R 775 ./dex2jar

# Donwload AXMLPrinter2.jar
cd ${lib_home}
mkdir -m 775 axmlprinter
cd ./axmlprinter
wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/android4me/AXMLPrinter2.jar
chmod 775 ./AXMLPrinter2.jar

# Downlaod Jad
cd ${lib_home}
mkdir -m 775 jad
cd ./jad
wget http://varaneckas.com/jad/jad158g.mac.intel.zip
unzip jad*.zip
rm -f jad*.zip
chmod 755 ./jad

echo '******************************************************'
echo '********         Install Successful        ***********'
echo '******************************************************'
