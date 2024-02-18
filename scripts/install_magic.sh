#! /bin/sh

set -e

sudo apt-get install -y m4 python3 libx11-dev tcl-dev tk-dev libcairo2-dev mesa-common-dev libglu1-mesa-dev

git clone -b $MAGIC_VERSION https://github.com/RTimothyEdwards/magic /tmp/magic
cd /tmp/magic
./configure
make -j4 
sudo make install
rm -rf /tmp/magic

# Add icon to the desktop:

mkdir -p ~/.local/share/applications
cat << EOF > ~/.local/share/applications/magic.desktop
[Desktop Entry]
Type=Application
Name=Magic
Icon=magic
Exec=magic -rcfile \$PDK_ROOT/sky130A/libs.tech/magic/sky130A.magicrc
Comment=Magic
Categories=Development;
Terminal=true
EOF

mkdir -p ~/.local/share/icons/hicolor
cat << EOF > ~/.local/share/icons/hicolor/magic.svg
<?xml version="1.0" encoding="iso-8859-1"?>
<!-- Generator: Adobe Illustrator 18.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 464.731 464.731" style="enable-background:new 0 0 464.731 464.731;" xml:space="preserve">
<g id="XMLID_207_">
	<path id="XMLID_212_" d="M463.056,441.971l-45.894-43.145l29.759-55.521c0.8-1.508,0.379-3.398-1.029-4.395
		c-1.388-1.011-3.305-0.832-4.487,0.424l-43.146,45.895l-55.533-29.746c-1.515-0.803-3.399-0.377-4.395,1.027
		c-1.017,1.392-0.815,3.309,0.438,4.488l45.911,43.162l-29.747,55.518c-0.816,1.525-0.378,3.401,1.01,4.412
		c1.41,0.996,3.326,0.816,4.502-0.438l43.149-45.912l55.507,29.746c1.506,0.802,3.393,0.378,4.393-1.027
		C464.506,445.072,464.308,443.136,463.056,441.971z"/>
	<path id="XMLID_211_" d="M369.086,94.641l-20.273,37.826c-1.04,1.918-0.479,4.307,1.285,5.588c1.783,1.271,4.215,1.029,5.71-0.559
		l29.417-31.269l37.78,20.26c1.921,1.024,4.323,0.484,5.589-1.285c1.271-1.783,1.048-4.215-0.555-5.709l-31.245-29.385
		l20.274-37.814c1.028-1.918,0.466-4.307-1.297-5.59c-1.766-1.268-4.216-1.025-5.713,0.558l-29.381,31.257l-37.814-20.273
		c-1.936-1.026-4.325-0.467-5.589,1.301c-1.273,1.766-1.042,4.214,0.544,5.711L369.086,94.641z"/>
	<path id="XMLID_210_" d="M123.956,360.06l-44.659,6.239l-17.611-41.484c-0.906-2.113-3.217-3.232-5.423-2.631
		c-2.226,0.623-3.626,2.78-3.313,5.051l6.239,44.639L17.69,389.489c-2.1,0.908-3.23,3.217-2.614,5.424
		c0.609,2.219,2.767,3.629,5.032,3.31l44.657-6.241l17.611,41.5c0.896,2.118,3.218,3.236,5.425,2.629
		c2.206-0.617,3.626-2.765,3.312-5.043l-6.238-44.658l41.5-17.617c2.099-0.904,3.234-3.217,2.612-5.423
		C128.383,361.147,126.221,359.745,123.956,360.06z"/>
	<path id="XMLID_209_" d="M4.908,45.161l34.646,9.537l-0.23,35.832c-0.012,2.01,1.449,3.704,3.447,3.99
		c1.976,0.271,3.851-0.969,4.377-2.901l9.521-34.565l35.923,0.225c2.01,0.016,3.702-1.447,3.992-3.441
		c0.271-1.982-0.97-3.853-2.905-4.383l-34.627-9.547l0.213-35.881c0.018-2.01-1.466-3.701-3.441-3.988
		c-1.983-0.273-3.856,0.965-4.383,2.901l-9.533,34.608L5.996,37.324c-1.991,0-3.701,1.463-3.974,3.441
		C1.751,42.747,2.992,44.633,4.908,45.161z"/>
	<path id="XMLID_208_" d="M278.019,234.519l139.775-18.477c1.586-0.21,2.762-1.555,2.762-3.143c0-1.587-1.176-2.928-2.762-3.142
		L278.019,191.28l20.476-57.755c0.857-2.446,0.235-5.183-1.603-7.009c-1.828-1.844-4.567-2.445-7.01-1.586l-57.697,20.484
		L213.708,5.688c-0.194-1.588-1.554-2.764-3.14-2.764c-1.584,0-2.935,1.176-3.146,2.764l-18.457,139.744l-57.772-20.502
		c-2.448-0.875-5.181-0.258-7.014,1.586c-1.84,1.826-2.46,4.563-1.586,7.009l20.489,57.772l-139.73,18.46
		c-1.584,0.214-2.762,1.555-2.762,3.142c0,1.588,1.178,2.933,2.762,3.143l139.73,18.461l-20.489,57.742
		c-0.874,2.447-0.254,5.182,1.586,7.01c1.833,1.842,4.565,2.462,7.014,1.582l57.772-20.467l18.457,139.743
		c0.212,1.583,1.563,2.764,3.146,2.764c1.586,0,2.945-1.181,3.14-2.764l18.477-139.743l57.727,20.486
		c2.441,0.876,5.181,0.256,7.009-1.589c1.845-1.825,2.461-4.562,1.584-7.007L278.019,234.519z"/>
</g>
</svg>
EOF
