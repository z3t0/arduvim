

def gen_list(path):
    import os
    folders_to_ignore = ['drivers','examples','hardware', 'java', 'reference','tools']
    
    keyword_files_list = []
    
    for root, dirs, files, in os.walk(path):
        for file in files:
            if file.endswith("keywords.txt"):
                keyword_files_list.append(os.path.join(root, file))
    

    return get_def(keyword_files_list)

def get_def(keyword_files_list):
    
    i = ''

    for idx, val in enumerate(keyword_files_list):
        if idx == 0:
            first = True
        else:
            first = False
        i += '"' + val + '{{{'
        i += gen_def(keyword_files_list[idx], first)

    return i

def gen_def(path, first):
    fileobj = open(path, 'r')
    heading = ''
    bufferobj = ''

    constants = []
    types = []
    functions = []
    operators = []

    constantname = 'arduinoConstant'
    typename = 'arduinoType'
    functionname = 'arduinoFunc'
    operatorname = 'arduinoOperator'

    prefix = 'syn keyword '

    for rawline in fileobj:
        line = rawline.rstrip('\r\n')

        if line.rstrip():

            if line[0] == '#':
                if first:
                    continue
                if '#######################################' in line:
                    continue
                else:
                    heading = line 
            else:

                try:
                    keyword, word = line.split('\t')[:2]
                except:
                    print("Exception in line: " + line)
                if keyword.isupper():
                    constants.append(keyword)
                elif "datatypes" in heading:
                    types.append(keyword)
                elif "operator" in heading:
                    operators.append(keyword)    
                elif "constant" in heading:
                    constants.append(keyword)
                elif "method" or "Method" or "Methods" or "methods" in heading:
                    functions.append(keyword)
                elif "function" in heading:
                    continue
                    functions.append(keyword)
                elif "USB" in heading:
                    functions.append(keyword)
                else:
                    print("Exception in: " + keyword)



    if len(constants) > 0: 
        for idx,val in enumerate(constants):
            if idx % 10 == 0:
                bufferobj += '\n' + '\t' + prefix + constantname
            elif idx == 0:
                bufferobj += '\t' + prefix + constantname + constants[idx]
            bufferobj += ' ' + constants[idx]

    if len(types) > 0:
        for idx, val in enumerate(types):
            if idx % 10 == 0:
                bufferobj += '\n' + '\t' + prefix + typename
            elif idx == 0:
                bufferobj += '\t' + '\t' + prefix + typename + types[idx]
            bufferobj += ' ' + types[idx]
    
    if len(functions) > 0:
        for idx, val in enumerate(functions):
            if idx % 10 == 0:
                bufferobj += '\n' + '\t' + prefix + functionname
            elif idx == 0:
                bufferobj += '\t' + prefix + functionname + functions[idx]
            bufferobj += ' ' + functions[idx]

    bufferobj += '\n' + '"}}}' + '\n'

    return bufferobj

def get_arduino_version(arduino_dir):
    import os
    
    try:
        version_file = os.path.join(arduino_dir, 'lib', 'version.txt')
        with open (version_file, 'r') as f:
            version = f.readline()
    except:
        version = 'unknown'
        print("Version not found")

    return version


def arduvim():
    import os
    import string
    import vim
    import datetime
    arduino_dir = vim.eval('g:arduvim_path')
    path = os.path.dirname(os.path.realpath(__file__))
    temppath = os.path.join(path, 'template.txt')
    template = string.Template(open(temppath).read())

    syntaxpath = os.path.dirname(os.path.dirname(os.path.dirname(os.path.realpath(__file__))))
    filepath = os.path.join(syntaxpath, "syntax", "arduino.vim")
    arduvim = open(filepath, 'w')

    arduvim.write(template.substitute({
        'date': datetime.datetime.now().strftime('%d %B %Y'),
        'arduino_version': get_arduino_version(arduino_dir),
        'rules': gen_list(arduino_dir),
        }))
    arduvim.close()
    print("Arduino sytax file has been generated! Please restart Vim")


