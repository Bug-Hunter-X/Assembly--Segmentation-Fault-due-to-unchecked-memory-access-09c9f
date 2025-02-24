# Assembly Memory Access Bug

This repository demonstrates a common error in assembly programming: accessing memory at an invalid address. The `bug.asm` file contains code that attempts to access memory without proper bounds checking, leading to a segmentation fault. The solution, provided in `bugSolution.asm`, incorporates checks to prevent this error.

## Bug Description
The primary issue lies in the direct memory access instruction (`mov eax, [ebx + ecx*4 + 0x10]`). The code lacks checks to verify:

1.  **Null Pointer:** `ebx` could point to null, causing a segmentation fault.
2.  **Array Bounds:** `ecx` is used as an index, but there's no validation to ensure it's within the array's boundaries.

## Solution
The `bugSolution.asm` file addresses these issues by adding checks before accessing memory. This involves verifying the pointers for null values and validating array indices against their expected range.

## How to Reproduce
1. Assemble the `bug.asm` file (using NASM or a similar assembler).
2. Link the object file to create an executable.
3. Run the executable; it will likely crash with a segmentation fault or similar error. 
4. Repeat steps 1-3 with `bugSolution.asm` to see the corrected behavior.