#!/usr/bin/python3
""" a Fabric script that generates a .tgz archive from the contents of the web_static folder of your AirBnB Clone repo, using the function do_pack. """

from datetime import datetime
from fabric.api import *


def do_pack():
    """
    must return the archive path if the archive has been correctly generated. Otherwise,it should return None
    """

    time = datetime.now()
    file = 'web_static_' + time.strftime("%Y%m%d%H%M%S") + '.' + 'tgz'
    local('mkdir -p versions')
    created = local('tar -cvzf versions/{} web_static'.format(file))
    if created is not None:
        return file
    else:
        return None
