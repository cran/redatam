# redatam 2.0.2

* I created a repo with all the datasets. Until my PR to cpp11 is accepted,
  this will not pass the CRAN checks, so I removed all the compiled code
  and provided a function to download the datasets from the repo.

# redatam 2.0.1

* Fixes memory leaks warned by CRAN on clang-ASAN and gcc-UBSAN.

# redatam 2.0.0

* First CRAN release.

# redatam 0.2.1

* CRAN requested changes:
  * Added Arseny Kapoulkine to 'ctb'
  * Added the Republic of Ecuador  to 'dtc'
  * Removed \dontrun{} from examples in the main function

# redatam 0.2

* Refactored to use C++11 instead of C++17.

# redatam 0.1

* First working version.
* Initial CRAN submission.
* Tested with the following census:
  * Chile 2017 (DIC and DICX)
  * Uruguay 2011 (DICX)
  * Galapagos, Ecuador 2015 (original in DIC reduced to macro levels with
    Redatam 7 and DICX created from the DIC file)
