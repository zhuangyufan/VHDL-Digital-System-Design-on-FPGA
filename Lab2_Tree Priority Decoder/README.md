### Block Diagram
The bolck diagram of the tree-shaped priority decoder is shown below.
<div align=center>
<img src="figs/block_diagram.png" width = 40%>
</div>

### RTL Schematic
For **cascade design**, every signal from input port to output port should pass through a sequence 2-to-1 multiplexers of length 14.
<div align=center>
<img src="figs/rtl_cas.png" width = 60%>
</div>

For **tree-shaped design**, the signal from input port to output port should pass through a sequence 2-to-1 multiplexers of a maximum length 6 (2 in the first layer and 4 in the second layer). 
<div align=center>
<img src="figs/rtl_tree.png" width = 60%>
</div>
