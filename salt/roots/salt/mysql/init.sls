mysql-server:
    pkg:
        - installed

mysql:
    service:
        - running
    require:
        - pkg.installed: mysql-server
    watch:
        - pkg.installed: mysql-server

# Need to write mysql configurations here
