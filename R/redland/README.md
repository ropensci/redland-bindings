
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

Once the Redland C libraries are installed, you may proceed with the installation of the redland R package
using typical R facilities, such as install.packages:

```sh
R --no-save -e 'install.packages("redland")'
```

## Example Usage

The `redland` library can be used for a wide variety of RDF parsing and creation tasks.  Some examples
are provided in the `redland_overview` vignette.  As a quick start, here is an example that
creates an RDF graph using an in-memory storage model, adds some triples, and then
serializes the graph to disk.

```r
library(redland)

# World is the redland mechanism for scoping models
world <- new("World")

# Storage provides a mechanism to store models; in-memory hashes are convenient for small models
storage <- new("Storage", world, "hashes", name="", options="hash-type='memory'")

# A model is a set of Statements, and is associated with a particular Storage instance
model <- new("Model", world=world, storage, options="")

# Add some Dublin Core properties to the model
dc <- "http://purl.org/dc/elements/1.1/"
stmt <- new("Statement", world=world, 
        subject="http://ropensci.org/", predicate=paste0(dc, "title"), object="ROpenSci")
addStatement(model, stmt)
stmt <- new("Statement", world=world, 
        subject="http://ropensci.org/", predicate=paste0(dc, "language"), object="en")
addStatement(model, stmt)
stmt <- new("Statement", world=world, 
        subject="http://ropensci.org/", predicate=paste0(dc, "license"), 
        object="https://creativecommons.org/licenses/by/2.0/")
addStatement(model, stmt)

# Serialize the model to a TTL file
serializer <- new("Serializer", world, name="turtle", mimeType="text/turtle")
status <- setNameSpace(serializer, world, namespace="http://purl.org/dc/elements/1.1/", prefix="dc")  
filePath <- tempfile(pattern = "file", tmpdir = tempdir(), fileext = ".ttl")
status <- serializeToFile(serializer, world, model, filePath)
readLines(file(filePath))
```

[![ropensci_footer](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)
