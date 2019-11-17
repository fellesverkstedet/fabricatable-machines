# This converts a BOM file in CSV format, produced by KiCad Pcbnew,
# by selecting File / Fabrication Outputs / BOM File
# into the format expected by the JLCPCB manufacture service.
# At least in KiCad 5.1.4 the CSV output seems a bit broken in terms of column names,
# which is reflected in this code. If it changes in later KiCad versions, this script
# needs to change, too.

# Use this by running the command line: python convert_bom.py inputfile.csv outputfile.csv
# It will overwrite your output file without asking so be careful.

import pandas as pd
from sys import argv, exit

# Select these columns from the input file
FILTER = ["Id", "Quantity", "Designator"]

# Rename the columns based on these rules
JLCPCB_NAMES = {
    "Designator" : "Footprint",
    "Quantity" : "Comment",
    "Id" : "Designator"
}

# Read data, filter, rename and write output
data = pd.read_csv(argv[1], delimiter=";")
filtered = data[FILTER]
result = filtered.rename(JLCPCB_NAMES, axis="columns", errors="raise")
result.to_csv(argv[2], index=False)
