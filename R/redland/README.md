
# redland

The R package 'redland' provides methods to create, query and write information stored in the Resource Description Framework (RDF). 
An introduction to RDF can be found at http://www.w3.org/TR/rdf-primer.

This package is implemented as R scripts that provide an R interface (aka "wrapper") to the Redland RDF C libraries that are described at http://librdf.org/docs/api/index.html.

## Installation Notes 

Before the `redland` R package can be installed, the redland C libraries must be installed.

On Mac OSX you can use Macports to install the necessary libraries. From a terminal window
you can enter the command:

```
sudo port install redland
```

On Ubuntu the redland C libraries are installed with the commands:

```
apt update
apt-get install librdf0
apt-get install librdf0-dev
```

Once the Redland C libraries are installed, you may proceed with the installation of the redland R package.