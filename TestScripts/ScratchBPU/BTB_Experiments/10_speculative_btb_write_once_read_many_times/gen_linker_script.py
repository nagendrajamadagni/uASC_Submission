import sys

# Pin the three code sections that must sit at fixed virtual addresses so that
#   (a) the injector and reader indirect branches alias in the BTB on PC[23:0], and
#   (b) the reader's reconstructed {high16}:{BTB low32} target lands on the probe.
#
# Usage: python gen_linker_script.py <link_script> <sec_spec_reader> <sec_spec_injection> <sec_reader_landing>

if len(sys.argv) != 5:
    print("Usage: python gen_linker_script.py <link_script> <sec_spec_reader> <sec_spec_injection> <sec_reader_landing>")
    sys.exit(1)

link_script_file     = sys.argv[1]
sec_spec_reader_addr = sys.argv[2]
sec_spec_injection_addr = sys.argv[3]
sec_reader_landing_addr = sys.argv[4]

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
            f"  . = {sec_spec_reader_addr};\n",
            "  .sec_spec_reader : { *(.sec_spec_reader) }\n",
            "\n",
            f"  . = {sec_spec_injection_addr};\n",
            "  .sec_spec_injection : { *(.sec_spec_injection) }\n",
            "\n",
            f"  . = {sec_reader_landing_addr};\n",
            "  .sec_reader_landing : { *(.sec_reader_landing) }\n"
        ]
        content = content[:last_brace_index] + insert_lines + content[last_brace_index:]

    with open(link_script_file, 'w') as file:
        file.writelines(content)
else:
    print("Error: The format of the link script file does not meet the expected pattern.")
