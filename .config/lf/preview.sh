#!/bin/sh

# Arguments passed to previewer script by lf:
#  $1 = preview target file name
#  $2 = width of preview pane
#  $3 = height of preview pane
#  $4 = position x of preview pane
#  $5 = position y of preview pane

image() {
	chafa -f sixel -s "${2}x$3" --animate false "$1"
	exit 1
}

case "$(printf "%s\n" "$1" | awk '{print tolower($0)}')" in
	*.tgz|*.tar.gz) tar tzf "$1" ;;
	*.tar.bz2|*.tbz2) tar tjf "$1" ;;
	*.tar.txz|*.txz) xz --list "$1" ;;
	*.tar) tar tf "$1" ;;
	*.zip|*.jar|*.war|*.ear|*.oxt) unzip -l "$1";;
	*.rar) unrar l "$1" ;;
	*.7z) 7z l "$1" ;;
	*.[1-8]) man "$1" | col -b ;;
	*.o) nm "$1";;
	# *.torrent) transmission-show "$1" ;;
	*.iso) iso-info --no-header -l "$1" ;;
	*.odt|*.ods|*.odp|*.sxw) odt2txt "$1" ;;
	*.doc) catdoc "$1" ;;
	*.docx) docx2txt "$1" - ;;
	*.md) glow --width "$2" --style dark "$1" ;;
#	*.xls|*.xlsx)
#   	ssconvert --export-type=Gnumeric_stf:stf_csv "$1" "fd://1" | batorcat --language=csv
#		;;
 	*.wav|*.mp3|*.flac|*.m4a|*.wma|*.ape|*.ac3|*.og[agx]|*.spx|*.opus|*.as[fx]|*.mka)
 		exiftool "$1"
 		;;
# 	*.pdf)
#  		[ ! -f "${CACHE}.jpg" ] && \
#  			pdftoppm -jpeg -f 1 -singlefile "$1" "$CACHE"
#  		image "${CACHE}.jpg" "$2" "$3" "$4" "$5"
#       pdftotext -l 3 -layout "$1" -
# 		;;
# 	*.epub)
# 		[ ! -f "$CACHE" ] && \
# 			epub-thumbnailer "$1" "$CACHE" 1024
# 		image "$CACHE" "$2" "$3" "$4" "$5"
# 		;;
# 	*.avi|*.mp4|*.wmv|*.dat|*.3gp|*.ogv|*.mkv|*.mpg|*.mpeg|*.vob|*.fl[icv]|*.m2v|*.mov|*.webms|*.mts|*.m4v|*.r[am]|*.qt|*.divx)
# 		[ ! -f "${CACHE}.jpg" ] && \
# 			ffmpegthumbnailer -i "$1" -o "${CACHE}.jpg" -s 0 -q 5
# 		image "${CACHE}.jpg" "$2" "$3" "$4" "$5"
# 		;;
 	*.bmp|*.jpg|*.jpeg|*.png|*.xpm|*.webp|*.gif|*.svg)
		chafa -f sixel -s "${2}x$3" --animate false "$1"
		exit 1
 		;;
#    *.sixel|*.six) echo -e "printing sixel\n" $(cat "$1");;
#    *.sixel|*.six) cat "$1";;
   *) bat --color=always --style=plain --theme=TwoDark --pager=never --line-range=1:"$3" "$1" ;;
esac
exit 0