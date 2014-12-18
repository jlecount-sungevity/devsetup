mysql:
    pkg:
        - installed

mysql:
    service:
        - running
    host: 'localhost'
    user: 'whoami'

    require:
        - pkg.installed: mysql-server
    watch:
        - pkg.installed: mysql-server

# Need to write mysql configurations here
