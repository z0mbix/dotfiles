" Vim syntax file
" Language: yum.conf - Yellowdog Updater Modified
" Maintainer: David Ne\v{c}as (Yeti) <yeti@physics.muni.cz>
" Last Change: 2003-11-17
" URL: http://trific.ath.cx/Ftp/vim/syntax/yum.vim

" Setup {{{
" React to possibly already-defined syntax.
" For version 5.x: Clear all syntax items unconditionally
" For version 6.x: Quit when a syntax file was already loaded
if version >= 600
  if exists("b:current_syntax")
    finish
  endif
else
  syntax clear
endif

syn case match
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" Comments {{{
syn match yumComment "#.*$" contains=yumTodo
syn keyword yumTodo TODO FIXME NOT XXX contained
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" Sectioning and keywords {{{
syn match yumSection "^\[[^] ]\+\]" contains=yumMain
syn keyword yumMain main contained
syn keyword yumMainKeyword cachedir debuglevel errorlevel logfile contained
syn keyword yumMainKeyword tolerant pkgpolicy exclude exactarch contained
syn keyword yumMainKeyword distroverpkg diskspacecheck retries contained
syn keyword yumMainKeyword installonlypkgs assumeyes commands contained
" deprecated: syn keyword yumMainKeyword kernelpkgnames contained
syn keyword yumServerKeyword name nextgroup=yumTitle contained
syn keyword yumServerKeyword baseurl gpgcheck failovermethod exclude contained
syn match yumBOL "^" nextgroup=yumComment,yumSection,yumMainKeyword,yumServerKeyword skipwhite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" Values and specials {{{
syn match yumTitle ".*" contained contains=yumVariable
syn keyword yumPkgPolicy newest last
syn keyword yumCommand update upgrade install info remove list clean provides
syn keyword yumCommand search groupinstall groupupdate grouplist
syn match yumCommand "\<check-update\>"
syn keyword yumFailoverMethod roundrobin priority
syn match yumVariable "\$\(releasever\|arch\|basearch\|YUM[0-9]\)"
syn match yumSpecial "[*?]"
syn match yumDecNumber "\<\d\+\>"
syn match yumURL "\<\(http\|ftp\|file\)://[^ ]\+" contains=yumVariable
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" Define the default highlighting {{{
" For version 5.7 and earlier: Only when not done already
" For version 5.8 and later: Only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_yum_syntax_inits")
  if version < 508
    let did_yum_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink yumComment           Comment
  HiLink yumTodo              Todo
  HiLink yumDecNumber         Number
  HiLink yumCommand           yumValue
  HiLink yumFailoverMethod    yumValue
  HiLink yumPkgPolicy         yumValue
  HiLink yumValue             Constant
  HiLink yumURL               Constant
  HiLink yumSpecial           Special
  HiLink yumSection           Keyword
  HiLink yumMain              Keyword
  HiLink yumMainKeyword       Type
  HiLink yumServerKeyword     Type
  HiLink yumVariable          Identifier
  HiLink yumTitle             Title
  delcommand HiLink
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
let b:current_syntax = "yum"

