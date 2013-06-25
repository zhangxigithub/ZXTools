#! /usr/bin/python

import os
import urllib
import shutil


 
url = 'https://raw.github.com/zhangxigithub/ZXTools/master/ZXTools.podspec'



print "downloading ... "
urllib.urlretrieve(url, "./ZXTools.podspec")


dir1 = os.path.expanduser("~/.cocoapods/master/ZXTools/")
dir = os.path.expanduser("~/.cocoapods/master/ZXTools/1.4/")
file = os.path.expanduser("~/.cocoapods/master/ZXTools/1.4/ZXTools.podspec")



os.system('rm -rf ' + dir1)


os.makedirs(dir)


shutil.copyfile("./ZXTools.podspec", file) 

os.system('rm ./ZXTools.podspec')

