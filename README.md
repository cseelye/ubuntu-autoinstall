# ubuntu-autoinstall
Remaster an Ubuntu ISO into an automated, self-installing ISO.

## Usage
Create an `autoinstall` directory and populate it with the appropriate meta-data, vendor-data, user-data to automate the install to your needs.
Run `make` to remaster the ISO with your autoinstall and configure it to automatically start the installation. A subdirectory `out` will be created with the new ISO placed there, named `autoinstall_ubuntu.iso` by default.

The remastering is done inside a container, so the make process will first build the container and then run the `build-iso` script.

## Configuration
Some customization is available by setting environment variables, which are passed into the container:

| Variable Name | Description | Default |
| ------------- | ----------- | ------- |
| `ISO_URL` | URL of the source ISO | Ubuntu 20.04.3 live server ISO |
| `OUTFILE` | Filename of the new ISO to create | `autoinstall_ubuntu.iso` |
| `OUTDIR` | Directory to write the output ISO to | `out` |

Example:
```
OUTFILE=asdf.iso make
```
