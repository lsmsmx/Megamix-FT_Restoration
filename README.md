# Megamix-FT_Restoration

-------------------------------------------------------------------------------------------------------------------------

**Restores and improves FT Visuals such as tonemapping & subsurface-scattering & shadows**

-------------------------------------------------------------------------------------------------------------------------

A library for handling both bfsha and bnsh shader binaries capable of loading and saving. 
A modification tied to compile fragment shaders for Hatsune Miku Project Diva Megamix.
Vertex shader compiling is removed by default due to them getting broken caused by unsolved UAM compiler issue with bitwise operations. UAM built for arm64 linux.
https://github.com/nvnprogram/uam-nvn to refer the issue.
