import pandas as pd
import argparse
import os.path as path
from os import getcwd
from sys import exit
import glob


DESC = """Convert BOM and position files from KiCad Pcbnew to format desired by JLCPCB.

The BOM filename defaults to 'Project.csv' and the position filename defaults 
to 'Project-all-pos.csv', where 'Project' is the name of the current directory. 
Use the command line arguments to change these if necessary.

"""

COLUMN_FILTERS = {
    "POS" : ["Ref", "PosX", "PosY", "Side", "Rot"],
    "BOM" : ["Id", "Quantity", "Designator"]
}


JLCPCB_NAMES = {
    "POS" : {
        "Ref" : "Designator",
        "PosX" : "Mid X",
        "PosY" : "Mid Y",
        "Side" : "Layer",
        "Rot" : "Rotation"
    },
    "BOM" : {
        "Designator" : "Footprint",
        "Quantity" : "Comment",
        "Id" : "Designator"
    }
}


def find_projectfile():
    g = glob.glob("{}/*.kicad_pcb".format(getcwd()))
    if len(g) == 1:
        return g[0]
    else:
        return None


def filter(data, FILTER, RENAMES):
    filtered = data[FILTER]
    return filtered.rename(RENAMES, axis="columns", errors="raise")


def process(style, infile, overwrite, outfile):
    delim = ";" if style == "BOM" else ","
    try:
        data = pd.read_csv(infile, delimiter=delim)
        print("Opened {}.".format(infile))
    except FileNotFoundError:
        print("File not found: {}".format(infile))
        return
    filtered = filter(data, COLUMN_FILTERS[style], JLCPCB_NAMES[style])
    if path.exists(outfile) and not overwrite:
        print("{} exists already, use --force to overwrite!".format(outfile))
    else:
        filtered.to_csv(outfile, index=False)
        print("Wrote output to {}.".format(outfile))



if __name__=="__main__":
    maybe_project = find_projectfile()
    
    parser = argparse.ArgumentParser(description=DESC)
    if maybe_project is None:
        print("Warning: could not determine project name, --BOM and --pos arguments are required.")
        parser.add_argument("--BOM", metavar="BOM_file", help="BOM file from KiCad", default=argparse.SUPPRESS)
        parser.add_argument("--pos", metavar="position_file", help="Position file from KiCad", default=argparse.SUPPRESS)
    else:
        project = maybe_project.split(".")[0]
        DEFAULT_BOM = "{}.csv".format(project)
        DEFAULT_POS = "{}-all-pos.csv".format(project)
        parser.add_argument("--BOM", metavar="BOM_file", help="BOM file from KiCad", default=DEFAULT_BOM)
        parser.add_argument("--pos", metavar="position_file", help="Position file from KiCad", default=DEFAULT_POS)
    parser.add_argument("--force", "-f", action="store_true", help="Overwrite output files if they exist")
    parser.add_argument("--BOMto", help="Name of BOM output file (default: bom_to_fab.csv)", default="bom_to_fab.csv")
    parser.add_argument("--posto", help="Name of position output file (default: pos_to_fab.csv)", default="pos_to_fab.csv")
    args = vars(parser.parse_args())
    if not "BOM" in args:
        print("Error: No BOM file given!")
        exit()
    if not "pos" in args:
        print("Error: No position file given!")
        exit()
    
    process("BOM", args["BOM"], args["force"], args["BOMto"])
    process("POS", args["pos"], args["force"], args["posto"])
