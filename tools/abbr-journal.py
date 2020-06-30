abbrs = {
    'China Physics C': 'Chin Phys C',
    'Chinese Physics Letters': 'Chin Phys Lett',
    'Nuclear Instruments and Methods in Physics Research Section A': 'Nucl Instr and Meth A',
    'Nuclear Instruments and Methods in Physics Research Section A: Accelerators, Spectrometers, Detectors and Associated Equipment': 'Nucl Instr and Meth A',
    'Nuclear Instruments and Methods in Physics Research Section B': 'Nucl Instr and Meth B',
    'Nuclear Instruments and Methods in Physics Research Section B: Beam Interactions with Materials and Atoms': 'Nucl Instr and Meth B',
    'Physical Review C': 'Phys Rev C',
    'Physical Review D': 'Phys Rev D',
    'Physical Review E': 'Phys Rev E',
    'Physical Review Letters': 'Phys Rev Lett',
    'Physics Letters B': 'Phys Lett B',
}

lines = []

lines.append('''\
FUNCTION {short.journal}
{ 't :=
  t "l" change.case$ 's :=
''')

# for k, v in abbrs.items():
#     lines.append(f'  s "{k.lower()}" =\n    {{ "{v}" }} {{\n')
# lines.append(f'    t\n')
# for _ in range(len(abbrs)):
#     lines.append(f'  }} if$\n')

for k, v in abbrs.items():
    k = k.replace('.', '').lower()
    lines.append(f'  s "{k}" =\n')
    lines.append(f'    {{ "{v}" }}\n')
    lines.append(f'    \'skip$\n')
    lines.append(f'  if$\n')

lines.append('''\
  \'s :=
  s empty$
    { t }
    { s }
  if$
}
''')


for line in lines:
    print(line, end='')

with open('abbr.bst', 'w') as f:
    f.writelines(lines)
