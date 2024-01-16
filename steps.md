curl -LO https://github.com/javacc/javacc/archive/javacc-7.0.12.tar.gz


tar -xzf javacc-7.0.12.tar.gz


///////



cp -r javacc-javacc-7.0.12/bootstrap javacc-javacc-7.0.12/target


javacc-javacc-7.0.12/scripts/javacc code/AnalizadorSintactico.jj


javac AnalizadorSintactico.java


java AnalizadorSintactico < code/p7.txt
