#!/bin/bash
### gshmake: Makes executable, bash-interpreted, PGP-encrypted scripts.
# gshmake accepts one script as an argument.
# Input scripts need not include a shebang (#!/bin/bash)

# Remove shebang from cleartext.
sed -i '/\#\!\/bin\//d' $1

# Remove empty lines from cleartext.
sed -i '/^$/d' $1

# Encrypt original script and output to a temporary file.
gpg2 --output /tmp/$1.asc --sign --armor --encrypt $1 

# Create GSH script and prepend commands to interpret encrypted portion.
cat > $1.gsh << EOF
#!/bin/bash

gpg2 --decrypt 2> /dev/null << EOF | bash -s \$@

EOF

# Import encrypted portion from the temporary file.
cat /tmp/$1.asc >> $1.gsh

# Append EOF to close the PGP-encrypted portion.
printf "\nEOF" >> $1.gsh

# Remove temporary file and original.
rm /tmp/$1.asc

# Change GSH script owner to user and make executable.
chown $(whoami):$(whoami) $1.gsh
chmod +x $1.gsh

