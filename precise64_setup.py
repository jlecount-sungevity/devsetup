# for use with ubuntu vagrant minion

def _bootstrap_salt():
    # install salt
    return True

def bootstrap():
    _bootstrap_salt()

def Main():
    #bootstrap()
    print "Hello"

if __name__ == "__main__":
    Main()
