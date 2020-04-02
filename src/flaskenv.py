import hashlib
import os

BLOCK_SIZE = 65536

def genfilehash(file):
    file_hash = hashlib.sha1()
    with open(file, 'rb') as f:
        fb = f.read(BLOCK_SIZE)
        while len(fb) > 0:
            file_hash.update(fb)
            fb = f.read(BLOCK_SIZE)

    return file_hash.hexdigest()

def genfilehashshort(file):
    return genfilehash(file)[:8]

def appendhash(file):
    dirname = os.path.dirname(file)
    filename, ext = os.path.basename(file).split(".",1)
    newname = os.path.join(dirname, filename + '_' + genfilehashshort(file) + '.' + ext)
    return newname


