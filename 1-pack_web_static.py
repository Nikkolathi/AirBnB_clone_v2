#!/usr/bin/python3
""" a Fabric script that generates a .tgz archive from the contents of the web_static folder of your AirBnB Clone repo, using the function do_pack. """

from datetime import datetime
from fabric.api import local


def do_pack():
    """
    must return the archive path if the archive has been correctly generated. Otherwise,it should return None
    """
    try:
        local("mkdir -p versions")
        date = datetime.now().strftime("%Y%m%d%H%M%S")
        file = "versions/web_static_{}.tgz".format(date)
        _gzip = local("tar -cvzf {} web_static".format(file))
        return file
    except Exception:
        return None
