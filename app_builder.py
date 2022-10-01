import os
import sys
import fileinput
import subprocess
import shutil

files_list = [
    '1-blagoevgrad',
    '2-burgas',
    '3-varna',
    '4-velikotarnovo',
    '5-vidin',
    '6-vraca',
    '7-gabrovo',
    '8-dobrich',
    '9-kardzhali',
    '10-kiustendil',
    '11-lovech',
    '12-montana',
    '13-pazardzhik',
    '14-pernik',
    '15-pleven',
    '16-plovdiv',
    '17-plovdivoblast',
    '18-razgrad',
    '19-ruse',
    '20-silistra',
    '21-sliven',
    '22-smolyan',
    '23-sofia',
    '24-sofia',
    '25-sofia',
    '26-sofiaoblast',
    '27-starazagora',
    '28-targovishte',
    '29-haskovo',
    '30-shumen',
    '31-yambol',
]
for i in range(len(files_list)):

    jsonName = 'data_' + str(i+1) + '.json'
    demoName = 'demo_data.json'
    fileName = 'lib/model/data.dart'

    with open(fileName, 'r') as file :
        filedata = file.read()

        filedata = filedata.replace(demoName, jsonName)

    with open(fileName, 'w') as file:
        file.write(filedata)

    print('Starting Apk build for json file: ' + jsonName)

    p = subprocess.Popen(['flutter', 'build', 'apk', '--release'])
    p.wait()

    print('Apk with json file: ' + jsonName + ' , was built successfully')

    with open(fileName, 'r') as file :
        filedata = file.read()

        filedata = filedata.replace(jsonName, demoName)

    with open(fileName, 'w') as file:
        file.write(filedata)

    print('Dart json name was returned to ' + demoName)

    shutil.move('build/app/outputs/apk/release/app-release.apk', 'apks/' + files_list[i] + '.apk')
    print('File moved to: ' + 'apks/' + files_list[i] + '.apk')
    print('\n\n')

input("Press enter to exit ;)")