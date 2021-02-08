#!/usr/bin/python
# coding : utf-8

import argparse, logging, sys

class Iptables():

    cmd = []
    tables = {}
    tables.update({"filter": ('INPUT', 'FORWARD', 'OUTPUT')})
    tables.update({"nat": ('PREROUTING', 'OUTPUT', 'POSTROUTING')})
    tables.update({"mangle": ('PREROUTING', 'INPUT', 'FORWARD', 'OUTPUT', 'POSTROUTING')})

    policy = ('INPUT', 'FORWARD', 'OUTPUT')
    chain = ('INPUT', 'FORWARD', 'PREROUTING', 'POSTROUTING', 'OUTPUT')
    target = ('ACCEPT', 'DENY', 'REJECT', 'DROP')

    def reset(self):
        
        self.cmd.append("\n# Initialisation")

        for iTables in self.tables.keys():

            for iChain in self.tables[iTables]:
                
                # Accept all
                self.cmd.append("iptables -t {} -P {} {}".format(iTables, iChain, self.target[0]))

            # Delete, Flush 
            self.cmd.append("iptables -t {} -Z".format(iTables))
            self.cmd.append("iptables -t {} -F".format(iTables))
            self.cmd.append("iptables -t {} -X".format(iTables))
        
        self.cmd.append("\n# Default policy : DROP")

        for iPolicy in self.policy:
            
            # Change policy default
            self.cmd.append("iptables -P {} {}".format(iPolicy, self.target[3]))

        self.cmd.append("\n# Interface lo : ACCEPT")
        self.cmd.append("iptables -A INPUT -i lo -j ACCEPT")
        self.cmd.append("iptables -A OUTPUT -o lo -j ACCEPT")

        return self.cmd

def check_args(_agrs=None):
    
    # Init Argparse
    parser = argparse.ArgumentParser(description='Generate rules')

    parser.add_argument('-v', '--view', action="store_true", help="View rules")
    parser.add_argument('-o', '--output', metavar='OUTPUT', help="Generate rules in bash file")

    args = parser.parse_args()

    return args

def write_file(action, data, file):

    if action == "write":

        with open(file, 'w') as file:
            file.write(data + "\n")
    
    if action == "append":

        with open(file, 'a') as file:
            file.write(data + "\n")

def action(mode):
    
    rules = Iptables().reset()

    if mode.output is not None:
        
        # Header bash
        write_file('write', "#!/bin/bash", mode.output)

    for irules in rules:

        if mode.view:

            print(irules)

        if mode.output is not None:
            
            write_file('append', irules, mode.output)

def main():

    # Init Logger
    logger = logging.getLogger()
    logging.basicConfig(format='%(levelname)s :: %(message)s')

    args = check_args(sys.argv[1:])

    # Run
    action(args)

if __name__ == "__main__":

    main()
