
## redland

- **Author**: Matthew B. Jones and Peter Slaughter ([NCEAS](http://www.nceas.ucsb.edu))
- **License**: [Apache 2](http://opensource.org/licenses/Apache-2.0)
- [Package source code on Github](https://github.com/ropensci/redland-bindings)
- [**Submit Bugs and feature requests**](https://github.com/ropensci/redland-bindings/issues)

The R package `redland` provides methods to create, query and write information 
stored in the Resource Description Framework (RDF). An introduction to RDF can be 
found at http://www.w3.org/TR/rdf-primer.  In brief, RDF provides a structured
graph consisting of Statements composed of Subject, Predicate, and Object Nodes.

This package is implemented as R scripts that provide an R interface (aka 
"wrapper") to the Redland RDF C libraries that are described at 
http://librdf.org/docs/api/index.html.  In this redland R wrapper, S4 classes are
used to model RDF data structures.   A `redland::Statement` is composed of 
`redland::Node`s representing the subject, predicate, and object of each triple 
statement.  Statements can be composed into a graph by adding them to a 
`redland::Model`, which in turn can be serialized and deserialized to RDF's text 
formats using `redland::Serializer` and `redland::Parser`, respectively.

See the `redland_overview` vignette for a brief example of usage.

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
