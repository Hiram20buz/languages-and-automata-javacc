# Use a base image with JDK 8 installed from AdoptOpenJDK
FROM adoptopenjdk:8-jdk-hotspot

# Create a directory 'app' in the container
RUN mkdir /app

# Copy your JavaCC file, input file, and JavaCC distribution to the '/app' directory in the container
COPY AnalizadorSintactico.jj /app/
COPY p7.txt /app/
COPY javacc-7.0.12.tar.gz /app/

# Set the working directory to '/app' in the container
WORKDIR /app

# Extract JavaCC from the tar.gz file into the current directory
RUN tar -xzf javacc-7.0.12.tar.gz


RUN cp -r javacc-javacc-7.0.12/bootstrap javacc-javacc-7.0.12/target


# Run JavaCC on AnalizadorSintactico.jj
RUN javacc-javacc-7.0.12/scripts/javacc AnalizadorSintactico.jj

# Compile the generated Java files
RUN javac AnalizadorSintactico.java

# Set the entry point when the container starts (you can adjust this according to your needs)
#CMD ["ls"]
CMD ["java", "AnalizadorSintactico"]

