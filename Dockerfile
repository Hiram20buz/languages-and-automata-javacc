# Use a base image with JDK 8 installed from AdoptOpenJDK
FROM adoptopenjdk:8-jdk-hotspot

# Create a directory 'app' in the container
RUN mkdir /app

# Copy your JavaCC file (Assuming 'AnalizadorSintactico.jj' is your JavaCC file) to the '/app' directory in the container
COPY AnalizadorSintactico.jj /app/
COPY p7.txt /app/
COPY javacc-javacc-7.0.12.tar.gz /app/

# Set the working directory to '/app' in the container
WORKDIR /app

# Extract JavaCC from the tar.gz file into the current directory
RUN tar -xzf javacc-javacc-7.0.12.tar.gz


# Add the scripts directory to PATH and make scripts executable
ENV PATH="${PATH}:/app/javacc-javacc-7.0.12/scripts"
RUN chmod +x javacc-javacc-7.0.12/scripts/javacc

# Run JavaCC on AnalizadorSintactico.jj
RUN javacc AnalizadorSintactico.jj

# Compile the generated Java files
RUN javac AnalizadorSintactico.java

# Set the entry point when the container starts (you can adjust this according to your needs)
CMD ["java", "AnalizadorSintactico"]
