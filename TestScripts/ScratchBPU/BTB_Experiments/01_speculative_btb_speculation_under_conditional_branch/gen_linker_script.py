import sys
import random

def flip_bit(number, bit_position):
    return number ^ (1 << bit_position)

if len(sys.argv) != 5:
    print("Usage: python modify_link_script.py <link_script_file> <sec_test_ibranch> <sec_gadget> <sec_test_target>")
    sys.exit(1)

link_script_file = sys.argv[1]
sec_test_ibranch_addr = sys.argv[2]
sec_gadget_addr = sys.argv[3]
sec_test_target_addr = sys.argv[4]

with open(link_script_file, 'r') as file:
    lines = file.readlines()

start_index = None
end_index = None
for i, line in enumerate(lines):
    if '====' in line.strip():
        if start_index is None:
            start_index = i + 1
        else:
            end_index = i

if start_index is not None and end_index is not None:
    content = lines[start_index:end_index]

    last_brace_index = None
    for i in range(len(content) - 1, -1, -1):
        if '}' in content[i]:
            last_brace_index = i
            break

    if last_brace_index is not None:
        insert_lines = [
            f"  . = {sec_test_ibranch_addr};\n",
            "  .sec_test_ibranch : { *(.sec_test_ibranch) }\n",
            "\n",
            f"  . = {sec_gadget_addr};\n",
            "  .sec_gadget : { *(.sec_gadget) }\n",
            "\n",
            f"  . = {sec_test_target_addr};\n",
            "  .sec_test_target : { *(.sec_test_target) }\n"
        ]
        content = content[:last_brace_index] + insert_lines + content[last_brace_index:]

    with open(link_script_file, 'w') as file:
        file.writelines(content)
    
else:
    print("Error: The format of the link script file does not meet the expected pattern.")
