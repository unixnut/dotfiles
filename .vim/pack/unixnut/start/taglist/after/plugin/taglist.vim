if exists('loaded_taglist')
  set statusline=%<%-45(%f\ %h%w%m%r\ %)%-20.60(%{Tlist_Get_Tagname_By_Line()}%)%=\ \ %17(%-14(%l,%c%V%)\ %=\ %P%)
endif
