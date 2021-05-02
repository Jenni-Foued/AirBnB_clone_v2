#!/usr/bin/python3
"""
Fabric script that generates a .tgz archive
from the contents of the web_static folder
"""

from fabric.api import local
from datetime import datetime
from os.path import exists


def do_pack():
    """generates a .tgz archive"""
    date = datetime.now().strftime("%Y%m%d%H%M%S")
    if not (exists('versions')):
        local('mkdir -p verions')
    file_name = "versions/web_static_{}.tgz".format(date)
    local("tar -cvzf {} web_static".format(file_name))
    return file_name
    if (exits(file_name)):
        return path
    return None
