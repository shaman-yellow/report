let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <C-L> f)x;
imap <Nul> <C-Space>
inoremap <expr> <Up> pumvisible() ? "\" : "\<Up>"
inoremap <expr> <S-Tab> pumvisible() ? "\" : "\<S-Tab>"
inoremap <expr> <Down> pumvisible() ? "\" : "\<Down>"
inoremap <C-C> 
inoremap <silent> <Plug>(ale_complete) :ALEComplete
inoremap <silent> <Plug>NERDCommenterInsert :call nerdcommenter#Comment('i', "Insert")
inoremap <silent> <SNR>49_AutoPairsReturn =AutoPairsReturn()
cnoremap <C-J> <Down>
cnoremap <C-K> <Up>
inoremap <C-Space> :call g:ZFVimIME_keymap_toggle_i()
nnoremap  :%s/\n\{3,\}/\r\r/
noremap  :call TempFix()
tnoremap 	 	
nnoremap 	[ ?functionf{i 
nnoremap 		 df,"_dwf,a p
nnoremap 	i :Tc
nnoremap 	j :Ti
nnoremap <NL> :call Tab_switch()
tnoremap <NL> w:res 20
nnoremap  f)%%x``hdiwx
nnoremap  :call Insert_line()i
nnoremap  "+p
tnoremap  N
vnoremap  "+y
nnoremap  f :call Pretty_function()f a?<-f(%%a``i
nnoremap  j {/{wyt,`mp
nnoremap  gi :NERDTreeFindgi
nnoremap  i :NERDTreeFind
nnoremap  o :NERDTreeFocus
nnoremap  w 
nnoremap    :set undoreload=0 | edit
nnoremap  l mm:LeaderfLineAll@article
nnoremap  m |:res
nnoremap  n T
nnoremap ,d :YcmShowDetailedDiagnostic
nnoremap <silent> ,b :LeaderfBuffer
nnoremap <silent> ,f :LeaderfFile
nmap ,ca <Plug>NERDCommenterAltDelims
xmap ,cu <Plug>NERDCommenterUncomment
nmap ,cu <Plug>NERDCommenterUncomment
xmap ,cb <Plug>NERDCommenterAlignBoth
nmap ,cb <Plug>NERDCommenterAlignBoth
xmap ,cl <Plug>NERDCommenterAlignLeft
nmap ,cl <Plug>NERDCommenterAlignLeft
nmap ,cA <Plug>NERDCommenterAppend
xmap ,cy <Plug>NERDCommenterYank
nmap ,cy <Plug>NERDCommenterYank
xmap ,cs <Plug>NERDCommenterSexy
nmap ,cs <Plug>NERDCommenterSexy
xmap ,ci <Plug>NERDCommenterInvert
nmap ,ci <Plug>NERDCommenterInvert
nmap ,c$ <Plug>NERDCommenterToEOL
xmap ,cn <Plug>NERDCommenterNested
nmap ,cn <Plug>NERDCommenterNested
xmap ,cm <Plug>NERDCommenterMinimal
nmap ,cm <Plug>NERDCommenterMinimal
xmap ,c  <Plug>NERDCommenterToggle
nmap ,c  <Plug>NERDCommenterToggle
xmap ,cc <Plug>NERDCommenterComment
nmap ,cc <Plug>NERDCommenterComment
noremap - ;
nnoremap ;epdf :!R CMD Rd2pdf --title="exMCnebula2" -o ../reference.pdf ..
nnoremap ;pdf :!R CMD Rd2pdf --title="MCnebula2" -o ../reference.pdf ..
nnoremap ;r :Rinsert 
vnoremap ;cc :s/^/#\' /g
vnoremap ;cu :s/#\'[^a-z]\{0,1\}//g
xnoremap <silent> <expr> ;. ZFVimIME_keymap_remove_v()
nnoremap <silent> <expr> ;. ZFVimIME_keymap_remove_n()
xnoremap <silent> <expr> ;, ZFVimIME_keymap_add_v()
nnoremap <silent> <expr> ;, ZFVimIME_keymap_add_n()
vnoremap <silent> <expr> ;: ZFVimIME_keymap_next_v()
nnoremap <silent> <expr> ;: ZFVimIME_keymap_next_n()
vnoremap <silent> <expr> ;; ZFVimIME_keymap_toggle_v()
nnoremap <silent> <expr> ;; ZFVimIME_keymap_toggle_n()
nnoremap ;b :RSend custom_render("index.Rmd")
nnoremap ;e :tabnew:Startify
nnoremap ;f :tabe ~/.vim/after/ftplugin/
nnoremap ;n :nohlsearch
nnoremap ;q :q
nnoremap ;s :source ~/.vimrc
nnoremap ;sf :source ~/.vim/after/ftplugin/
nnoremap ;v :tabe ~/.vim/after/ftplugin/.vimrc
nnoremap ;w :w
nmap <p <Plug>(unimpaired-put-below-leftward)
nmap <P <Plug>(unimpaired-put-above-leftward)
nmap <s <Plug>(unimpaired-enable)
nmap =p <Plug>(unimpaired-put-below-reformat)
nmap =P <Plug>(unimpaired-put-above-reformat)
nmap =s <Plug>(unimpaired-toggle)
nmap >p <Plug>(unimpaired-put-below-rightward)
nmap >P <Plug>(unimpaired-put-above-rightward)
nmap >s <Plug>(unimpaired-disable)
nmap [xx <Plug>(unimpaired-xml-encode-line)
xmap [x <Plug>(unimpaired-xml-encode)
nmap [x <Plug>(unimpaired-xml-encode)
nmap [uu <Plug>(unimpaired-url-encode-line)
xmap [u <Plug>(unimpaired-url-encode)
nmap [u <Plug>(unimpaired-url-encode)
nmap [CC <Plug>(unimpaired-string-encode-line)
xmap [C <Plug>(unimpaired-string-encode)
nmap [C <Plug>(unimpaired-string-encode)
nmap [yy <Plug>(unimpaired-string-encode-line)
xmap [y <Plug>(unimpaired-string-encode)
nmap [y <Plug>(unimpaired-string-encode)
nmap [P <Plug>(unimpaired-put-above)
nmap [p <Plug>(unimpaired-put-above)
nmap [o <Plug>(unimpaired-enable)
xmap [e <Plug>(unimpaired-move-selection-up)
nmap [e <Plug>(unimpaired-move-up)
nmap [  <Plug>(unimpaired-blank-up)
omap [n <Plug>(unimpaired-context-previous)
xmap [n <Plug>(unimpaired-context-previous)
nmap [n <Plug>(unimpaired-context-previous)
nmap [f <Plug>(unimpaired-directory-previous)
nmap [<C-T> <Plug>(unimpaired-ptprevious)
nmap [ <Plug>(unimpaired-ptprevious)
nmap [T <Plug>(unimpaired-tfirst)
nmap [t <Plug>(unimpaired-tprevious)
nmap [<C-Q> <Plug>(unimpaired-cpfile)
nmap [ <Plug>(unimpaired-cpfile)
nmap [Q <Plug>(unimpaired-cfirst)
nmap [q <Plug>(unimpaired-cprevious)
nmap [<C-L> <Plug>(unimpaired-lpfile)
nmap [ <Plug>(unimpaired-lpfile)
nmap [L <Plug>(unimpaired-lfirst)
nmap [l <Plug>(unimpaired-lprevious)
nmap [B <Plug>(unimpaired-bfirst)
nmap [b <Plug>(unimpaired-bprevious)
nmap [A <Plug>(unimpaired-first)
nmap [a <Plug>(unimpaired-previous)
nmap ]xx <Plug>(unimpaired-xml-decode-line)
xmap ]x <Plug>(unimpaired-xml-decode)
nmap ]x <Plug>(unimpaired-xml-decode)
nmap ]uu <Plug>(unimpaired-url-decode-line)
xmap ]u <Plug>(unimpaired-url-decode)
nmap ]u <Plug>(unimpaired-url-decode)
nmap ]CC <Plug>(unimpaired-string-decode-line)
xmap ]C <Plug>(unimpaired-string-decode)
nmap ]C <Plug>(unimpaired-string-decode)
nmap ]yy <Plug>(unimpaired-string-decode-line)
xmap ]y <Plug>(unimpaired-string-decode)
nmap ]y <Plug>(unimpaired-string-decode)
nmap ]P <Plug>(unimpaired-put-below)
nmap ]p <Plug>(unimpaired-put-below)
nmap ]o <Plug>(unimpaired-disable)
xmap ]e <Plug>(unimpaired-move-selection-down)
nmap ]e <Plug>(unimpaired-move-down)
nmap ]  <Plug>(unimpaired-blank-down)
omap ]n <Plug>(unimpaired-context-next)
xmap ]n <Plug>(unimpaired-context-next)
nmap ]n <Plug>(unimpaired-context-next)
nmap ]f <Plug>(unimpaired-directory-next)
nmap ]<C-T> <Plug>(unimpaired-ptnext)
nmap ] <Plug>(unimpaired-ptnext)
nmap ]T <Plug>(unimpaired-tlast)
nmap ]t <Plug>(unimpaired-tnext)
nmap ]<C-Q> <Plug>(unimpaired-cnfile)
nmap ] <Plug>(unimpaired-cnfile)
nmap ]Q <Plug>(unimpaired-clast)
nmap ]q <Plug>(unimpaired-cnext)
nmap ]<C-L> <Plug>(unimpaired-lnfile)
nmap ] <Plug>(unimpaired-lnfile)
nmap ]L <Plug>(unimpaired-llast)
nmap ]l <Plug>(unimpaired-lnext)
nmap ]B <Plug>(unimpaired-blast)
nmap ]b <Plug>(unimpaired-bnext)
nmap ]A <Plug>(unimpaired-last)
nmap ]a <Plug>(unimpaired-next)
xmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
nnoremap j gj
nnoremap k gk
nnoremap tg gT
nmap yo <Plug>(unimpaired-toggle)
noremap <C-F> :call TempFix()
nnoremap <Right> :RSend source("~/.vim/after/ftplugin/r/initialize.R")
nnoremap <Plug>LeaderfGtagsDefinition :=leaderf#Gtags#startCmdline(0, 1, 'd')
nnoremap <Plug>LeaderfGtagsReference :=leaderf#Gtags#startCmdline(0, 1, 'r')
nnoremap <Plug>LeaderfGtagsSymbol :=leaderf#Gtags#startCmdline(0, 1, 's')
nnoremap <Plug>LeaderfGtagsGrep :=leaderf#Gtags#startCmdline(0, 1, 'g')
nnoremap <C-K> f)%%x``hdiwx
vnoremap <Right> <Nop>
onoremap <Right> <Nop>
nnoremap <Left>t :RSend source("~/.vim/after/ftplugin/r/initialize2.R")
nnoremap <Left>m :RSend devtools::load_all("~/MCnebula2")
nnoremap <Left>e :RSend devtools::load_all("~/exMCnebula2")
nnoremap <Left>r :RSend roxygen2::roxygenize("..")
nnoremap <silent> <Plug>(YCMFindSymbolInDocument) :call youcompleteme#finder#FindSymbol( 'document' )
nnoremap <silent> <Plug>(YCMFindSymbolInWorkspace) :call youcompleteme#finder#FindSymbol( 'workspace' )
nnoremap <Down><Down> :RSend source("~/.vim/after/ftplugin/removeOldClassReLoad.R")
nnoremap <Left><Left> :RSend devtools::load_all("~/utils.tool")
xnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))
vnoremap <silent> <Plug>LeaderfGtagsGrep :=leaderf#Gtags#startCmdline(2, 1, 'g')
vnoremap <silent> <Plug>LeaderfGtagsSymbol :=leaderf#Gtags#startCmdline(2, 1, 's')
vnoremap <silent> <Plug>LeaderfGtagsReference :=leaderf#Gtags#startCmdline(2, 1, 'r')
vnoremap <silent> <Plug>LeaderfGtagsDefinition :=leaderf#Gtags#startCmdline(2, 1, 'd')
onoremap <Plug>LeaderfGtagsGrep :=leaderf#Gtags#startCmdline(0, 1, 'g')
onoremap <Plug>LeaderfGtagsSymbol :=leaderf#Gtags#startCmdline(0, 1, 's')
onoremap <Plug>LeaderfGtagsReference :=leaderf#Gtags#startCmdline(0, 1, 'r')
onoremap <Plug>LeaderfGtagsDefinition :=leaderf#Gtags#startCmdline(0, 1, 'd')
vnoremap <silent> <Plug>LeaderfRgBangVisualRegexBoundary :=leaderf#Rg#startCmdline(2, 1, 1, 1)
vnoremap <silent> <Plug>LeaderfRgBangVisualRegexNoBoundary :=leaderf#Rg#startCmdline(2, 1, 1, 0)
vnoremap <silent> <Plug>LeaderfRgBangVisualLiteralBoundary :=leaderf#Rg#startCmdline(2, 1, 0, 1)
vnoremap <silent> <Plug>LeaderfRgBangVisualLiteralNoBoundary :=leaderf#Rg#startCmdline(2, 1, 0, 0)
vnoremap <silent> <Plug>LeaderfRgVisualRegexBoundary :=leaderf#Rg#startCmdline(2, 0, 1, 1)
vnoremap <silent> <Plug>LeaderfRgVisualRegexNoBoundary :=leaderf#Rg#startCmdline(2, 0, 1, 0)
vnoremap <silent> <Plug>LeaderfRgVisualLiteralBoundary :=leaderf#Rg#startCmdline(2, 0, 0, 1)
vnoremap <silent> <Plug>LeaderfRgVisualLiteralNoBoundary :=leaderf#Rg#startCmdline(2, 0, 0, 0)
noremap <Plug>LeaderfRgWORDRegexBoundary :=leaderf#Rg#startCmdline(1, 0, 1, 1)
noremap <Plug>LeaderfRgWORDRegexNoBoundary :=leaderf#Rg#startCmdline(1, 0, 1, 0)
noremap <Plug>LeaderfRgWORDLiteralBoundary :=leaderf#Rg#startCmdline(1, 0, 0, 0)
noremap <Plug>LeaderfRgWORDLiteralNoBoundary :=leaderf#Rg#startCmdline(1, 0, 0, 0)
noremap <Plug>LeaderfRgBangCwordRegexBoundary :=leaderf#Rg#startCmdline(0, 1, 1, 1)
noremap <Plug>LeaderfRgBangCwordRegexNoBoundary :=leaderf#Rg#startCmdline(0, 1, 1, 0)
noremap <Plug>LeaderfRgBangCwordLiteralBoundary :=leaderf#Rg#startCmdline(0, 1, 0, 1)
noremap <Plug>LeaderfRgBangCwordLiteralNoBoundary :=leaderf#Rg#startCmdline(0, 1, 0, 0)
noremap <Plug>LeaderfRgCwordRegexBoundary :=leaderf#Rg#startCmdline(0, 0, 1, 1)
noremap <Plug>LeaderfRgCwordRegexNoBoundary :=leaderf#Rg#startCmdline(0, 0, 1, 0)
noremap <Plug>LeaderfRgCwordLiteralBoundary :=leaderf#Rg#startCmdline(0, 0, 0, 1)
noremap <Plug>LeaderfRgCwordLiteralNoBoundary :=leaderf#Rg#startCmdline(0, 0, 0, 0)
noremap <Plug>LeaderfRgPrompt :Leaderf rg -e 
noremap <silent> <Plug>LeaderfMruCwdFullScreen :Leaderf mru --fullScreen
noremap <silent> <Plug>LeaderfMruCwdRight :Leaderf mru --right
noremap <silent> <Plug>LeaderfMruCwdLeft :Leaderf mru --left
noremap <silent> <Plug>LeaderfMruCwdBottom :Leaderf mru --bottom
noremap <silent> <Plug>LeaderfMruCwdTop :Leaderf mru --top
noremap <silent> <Plug>LeaderfBufferFullScreen :Leaderf buffer --fullScreen
noremap <silent> <Plug>LeaderfBufferRight :Leaderf buffer --right
noremap <silent> <Plug>LeaderfBufferLeft :Leaderf buffer --left
noremap <silent> <Plug>LeaderfBufferBottom :Leaderf buffer --bottom
noremap <silent> <Plug>LeaderfBufferTop :Leaderf buffer --top
noremap <silent> <Plug>LeaderfFileFullScreen :Leaderf file --fullScreen
noremap <silent> <Plug>LeaderfFileRight :Leaderf file --right
noremap <silent> <Plug>LeaderfFileLeft :Leaderf file --left
noremap <silent> <Plug>LeaderfFileBottom :Leaderf file --bottom
noremap <silent> <Plug>LeaderfFileTop :Leaderf file --top
nnoremap <silent> <Plug>unimpairedTPNext :exe "p".(v:count ? v:count : "")."tnext"
nnoremap <silent> <Plug>unimpairedTPPrevious :exe "p".(v:count ? v:count : "")."tprevious"
nnoremap <silent> <Plug>(unimpaired-ptnext) :exe v:count1 . "ptnext"
nnoremap <silent> <Plug>(unimpaired-ptprevious) :exe v:count1 . "ptprevious"
nnoremap <silent> <Plug>unimpairedTLast :exe "".(v:count ? v:count : "")."tlast"
nnoremap <silent> <Plug>unimpairedTFirst :exe "".(v:count ? v:count : "")."tfirst"
nnoremap <silent> <Plug>unimpairedTNext :exe "".(v:count ? v:count : "")."tnext"
nnoremap <silent> <Plug>unimpairedTPrevious :exe "".(v:count ? v:count : "")."tprevious"
nnoremap <Plug>(unimpaired-tlast) :=v:count ? v:count . "trewind" : "tlast"
nnoremap <Plug>(unimpaired-tfirst) :=v:count ? v:count . "trewind" : "tfirst"
nnoremap <silent> <Plug>(unimpaired-tnext) :exe "".(v:count ? v:count : "")."tnext"
nnoremap <silent> <Plug>(unimpaired-tprevious) :exe "".(v:count ? v:count : "")."tprevious"
nnoremap <silent> <Plug>unimpairedQNFile :exe "".(v:count ? v:count : "")."cnfile"zv
nnoremap <silent> <Plug>unimpairedQPFile :exe "".(v:count ? v:count : "")."cpfile"zv
nnoremap <silent> <Plug>(unimpaired-cnfile) :exe "".(v:count ? v:count : "")."cnfile"zv
nnoremap <silent> <Plug>(unimpaired-cpfile) :exe "".(v:count ? v:count : "")."cpfile"zv
nnoremap <silent> <Plug>unimpairedQLast :exe "".(v:count ? v:count : "")."clast"zv
nnoremap <silent> <Plug>unimpairedQFirst :exe "".(v:count ? v:count : "")."cfirst"zv
nnoremap <silent> <Plug>unimpairedQNext :exe "".(v:count ? v:count : "")."cnext"zv
nnoremap <silent> <Plug>unimpairedQPrevious :exe "".(v:count ? v:count : "")."cprevious"zv
nnoremap <Plug>(unimpaired-clast) :=v:count ? v:count . "cc" : "clast"zv
nnoremap <Plug>(unimpaired-cfirst) :=v:count ? v:count . "cc" : "cfirst"zv
nnoremap <silent> <Plug>(unimpaired-cnext) :exe "".(v:count ? v:count : "")."cnext"zv
nnoremap <silent> <Plug>(unimpaired-cprevious) :exe "".(v:count ? v:count : "")."cprevious"zv
nnoremap <silent> <Plug>unimpairedLNFile :exe "".(v:count ? v:count : "")."lnfile"zv
nnoremap <silent> <Plug>unimpairedLPFile :exe "".(v:count ? v:count : "")."lpfile"zv
nnoremap <silent> <Plug>(unimpaired-lnfile) :exe "".(v:count ? v:count : "")."lnfile"zv
nnoremap <silent> <Plug>(unimpaired-lpfile) :exe "".(v:count ? v:count : "")."lpfile"zv
nnoremap <silent> <Plug>unimpairedLLast :exe "".(v:count ? v:count : "")."llast"zv
nnoremap <silent> <Plug>unimpairedLFirst :exe "".(v:count ? v:count : "")."lfirst"zv
nnoremap <silent> <Plug>unimpairedLNext :exe "".(v:count ? v:count : "")."lnext"zv
nnoremap <silent> <Plug>unimpairedLPrevious :exe "".(v:count ? v:count : "")."lprevious"zv
nnoremap <Plug>(unimpaired-llast) :=v:count ? v:count . "ll" : "llast"zv
nnoremap <Plug>(unimpaired-lfirst) :=v:count ? v:count . "ll" : "lfirst"zv
nnoremap <silent> <Plug>(unimpaired-lnext) :exe "".(v:count ? v:count : "")."lnext"zv
nnoremap <silent> <Plug>(unimpaired-lprevious) :exe "".(v:count ? v:count : "")."lprevious"zv
nnoremap <silent> <Plug>unimpairedBLast :exe "".(v:count ? v:count : "")."blast"
nnoremap <silent> <Plug>unimpairedBFirst :exe "".(v:count ? v:count : "")."bfirst"
nnoremap <silent> <Plug>unimpairedBNext :exe "".(v:count ? v:count : "")."bnext"
nnoremap <silent> <Plug>unimpairedBPrevious :exe "".(v:count ? v:count : "")."bprevious"
nnoremap <Plug>(unimpaired-blast) :=v:count ? v:count . "buffer" : "blast"
nnoremap <Plug>(unimpaired-bfirst) :=v:count ? v:count . "buffer" : "bfirst"
nnoremap <silent> <Plug>(unimpaired-bnext) :exe "".(v:count ? v:count : "")."bnext"
nnoremap <silent> <Plug>(unimpaired-bprevious) :exe "".(v:count ? v:count : "")."bprevious"
nnoremap <silent> <Plug>unimpairedALast :exe "".(v:count ? v:count : "")."last"
nnoremap <silent> <Plug>unimpairedAFirst :exe "".(v:count ? v:count : "")."first"
nnoremap <silent> <Plug>unimpairedANext :exe "".(v:count ? v:count : "")."next"
nnoremap <silent> <Plug>unimpairedAPrevious :exe "".(v:count ? v:count : "")."previous"
nnoremap <Plug>(unimpaired-last) :=v:count ? v:count . "argument" : "last"
nnoremap <Plug>(unimpaired-first) :=v:count ? v:count . "argument" : "first"
nnoremap <silent> <Plug>(unimpaired-next) :exe "".(v:count ? v:count : "")."next"
nnoremap <silent> <Plug>(unimpaired-previous) :exe "".(v:count ? v:count : "")."previous"
nnoremap <silent> <Plug>(ale_repeat_selection) :ALERepeatSelection
nnoremap <silent> <Plug>(ale_code_action) :ALECodeAction
nnoremap <silent> <Plug>(ale_filerename) :ALEFileRename
nnoremap <silent> <Plug>(ale_rename) :ALERename
nnoremap <silent> <Plug>(ale_import) :ALEImport
nnoremap <silent> <Plug>(ale_documentation) :ALEDocumentation
nnoremap <silent> <Plug>(ale_hover) :ALEHover
nnoremap <silent> <Plug>(ale_find_references) :ALEFindReferences
nnoremap <silent> <Plug>(ale_go_to_implementation_in_vsplit) :ALEGoToImplementation -vsplit
nnoremap <silent> <Plug>(ale_go_to_implementation_in_split) :ALEGoToImplementation -split
nnoremap <silent> <Plug>(ale_go_to_implementation_in_tab) :ALEGoToImplementation -tab
nnoremap <silent> <Plug>(ale_go_to_implementation) :ALEGoToImplementation
nnoremap <silent> <Plug>(ale_go_to_type_definition_in_vsplit) :ALEGoToTypeDefinition -vsplit
nnoremap <silent> <Plug>(ale_go_to_type_definition_in_split) :ALEGoToTypeDefinition -split
nnoremap <silent> <Plug>(ale_go_to_type_definition_in_tab) :ALEGoToTypeDefinition -tab
nnoremap <silent> <Plug>(ale_go_to_type_definition) :ALEGoToTypeDefinition
nnoremap <silent> <Plug>(ale_go_to_definition_in_vsplit) :ALEGoToDefinition -vsplit
nnoremap <silent> <Plug>(ale_go_to_definition_in_split) :ALEGoToDefinition -split
nnoremap <silent> <Plug>(ale_go_to_definition_in_tab) :ALEGoToDefinition -tab
nnoremap <silent> <Plug>(ale_go_to_definition) :ALEGoToDefinition
nnoremap <silent> <Plug>(ale_fix) :ALEFix
nnoremap <silent> <Plug>(ale_detail) :ALEDetail
nnoremap <silent> <Plug>(ale_lint) :ALELint
nnoremap <silent> <Plug>(ale_reset_buffer) :ALEResetBuffer
nnoremap <silent> <Plug>(ale_disable_buffer) :ALEDisableBuffer
nnoremap <silent> <Plug>(ale_enable_buffer) :ALEEnableBuffer
nnoremap <silent> <Plug>(ale_toggle_buffer) :ALEToggleBuffer
nnoremap <silent> <Plug>(ale_reset) :ALEReset
nnoremap <silent> <Plug>(ale_disable) :ALEDisable
nnoremap <silent> <Plug>(ale_enable) :ALEEnable
nnoremap <silent> <Plug>(ale_toggle) :ALEToggle
nnoremap <silent> <Plug>(ale_last) :ALELast
nnoremap <silent> <Plug>(ale_first) :ALEFirst
nnoremap <silent> <Plug>(ale_next_wrap_warning) :ALENext -wrap -warning
nnoremap <silent> <Plug>(ale_next_warning) :ALENext -warning
nnoremap <silent> <Plug>(ale_next_wrap_error) :ALENext -wrap -error
nnoremap <silent> <Plug>(ale_next_error) :ALENext -error
nnoremap <silent> <Plug>(ale_next_wrap) :ALENextWrap
nnoremap <silent> <Plug>(ale_next) :ALENext
nnoremap <silent> <Plug>(ale_previous_wrap_warning) :ALEPrevious -wrap -warning
nnoremap <silent> <Plug>(ale_previous_warning) :ALEPrevious -warning
nnoremap <silent> <Plug>(ale_previous_wrap_error) :ALEPrevious -wrap -error
nnoremap <silent> <Plug>(ale_previous_error) :ALEPrevious -error
nnoremap <silent> <Plug>(ale_previous_wrap) :ALEPreviousWrap
nnoremap <silent> <Plug>(ale_previous) :ALEPrevious
nnoremap <Plug>NERDCommenterAltDelims :call nerdcommenter#SwitchToAlternativeDelimiters(1)
xnoremap <silent> <Plug>NERDCommenterUncomment :call nerdcommenter#Comment("x", "Uncomment")
nnoremap <silent> <Plug>NERDCommenterUncomment :call nerdcommenter#Comment("n", "Uncomment")
xnoremap <silent> <Plug>NERDCommenterAlignBoth :call nerdcommenter#Comment("x", "AlignBoth")
nnoremap <silent> <Plug>NERDCommenterAlignBoth :call nerdcommenter#Comment("n", "AlignBoth")
xnoremap <silent> <Plug>NERDCommenterAlignLeft :call nerdcommenter#Comment("x", "AlignLeft")
nnoremap <silent> <Plug>NERDCommenterAlignLeft :call nerdcommenter#Comment("n", "AlignLeft")
nnoremap <silent> <Plug>NERDCommenterAppend :call nerdcommenter#Comment("n", "Append")
xnoremap <silent> <Plug>NERDCommenterYank :call nerdcommenter#Comment("x", "Yank")
nnoremap <silent> <Plug>NERDCommenterYank :call nerdcommenter#Comment("n", "Yank")
xnoremap <silent> <Plug>NERDCommenterSexy :call nerdcommenter#Comment("x", "Sexy")
nnoremap <silent> <Plug>NERDCommenterSexy :call nerdcommenter#Comment("n", "Sexy")
xnoremap <silent> <Plug>NERDCommenterInvert :call nerdcommenter#Comment("x", "Invert")
nnoremap <silent> <Plug>NERDCommenterInvert :call nerdcommenter#Comment("n", "Invert")
nnoremap <silent> <Plug>NERDCommenterToEOL :call nerdcommenter#Comment("n", "ToEOL")
xnoremap <silent> <Plug>NERDCommenterNested :call nerdcommenter#Comment("x", "Nested")
nnoremap <silent> <Plug>NERDCommenterNested :call nerdcommenter#Comment("n", "Nested")
xnoremap <silent> <Plug>NERDCommenterMinimal :call nerdcommenter#Comment("x", "Minimal")
nnoremap <silent> <Plug>NERDCommenterMinimal :call nerdcommenter#Comment("n", "Minimal")
xnoremap <silent> <Plug>NERDCommenterToggle :call nerdcommenter#Comment("x", "Toggle")
nnoremap <silent> <Plug>NERDCommenterToggle :call nerdcommenter#Comment("n", "Toggle")
xnoremap <silent> <Plug>NERDCommenterComment :call nerdcommenter#Comment("x", "Comment")
nnoremap <silent> <Plug>NERDCommenterComment :call nerdcommenter#Comment("n", "Comment")
nnoremap <silent> <Plug>(startify-open-buffers) :call startify#open_buffers()
nnoremap <Up>s :mksession! session.vim
nnoremap <Up><Up> :source session.vim
nnoremap <F3> :TagbarOpenAutoClose
nnoremap <C-B> :%s/\n\{3,\}/\r\r/
nnoremap <C-J> :call Tab_switch()
nnoremap <C-P> "+p
nnoremap <Up>l :call ZFVimIM_cloudLog()
nnoremap <Up>u :call ZFVimIM_upload()
noremap <Down> <Nop>
noremap <Down>t :terminal
noremap <Left> <Nop>
noremap <Up> <Nop>
noremap <F2> :NERDTreeToggle
tnoremap <C-J> w:res 20
tnoremap <C-V> N
vnoremap <C-Y> "+y
nnoremap <C-N> :call Insert_line()i
inoremap  
inoremap <expr> 	 pumvisible() ? "\" : "\	"
cnoremap <NL> <Down>
cnoremap  <Up>
inoremap  f)x;
inoremap ;r =FunEx_roxygen()
inoremap ;ct =FunEx_md_title()<End>a
inoremap ;cr =FunEx_md_code()
inoremap ;cc =FunEx_md_comment()
inoremap <silent> ;j =Get_args(2)dF d1b<BS>=Fast_print()bF)
inoremap ;i =Get_args(1)=Iabbrev_echo()
inoremap ;f =Annotate_file()F`i
inoremap ;d =Metadata_yaml()ka
inoremap ;t =strftime("%Y-%m-%dT%H:%M:%S+00:00")
inoremap ;t3 ## {-}bi i
inoremap ;t2 ## {-}bi i
inoremap ;t1 # {-}bi i
inoremap <silent> <expr> ;, ZFVimIME_keymap_add_i()
inoremap <silent> <expr> ;: ZFVimIME_keymap_next_i()
inoremap <silent> <expr> ;; ZFVimIME_keymap_toggle_i()
inoremap <silent> <expr> ;. ZFVimIME_keymap_remove_i()
inoremap ;b dF_s_
inoremap ;q F xgi
inoremap ;u b~gi
inoremap ;x bxgi
inoremap `i ``i
inoremap `` ```{r}```ka
inoremap `e ```{r eval = T, echo = F}```ka
inoremap `h ```{r eval = T, echo = F, results = "asis"}```ka
inoremap `f ```{r fig:call FigNum()a=g:rfig, eval = T, echo = F, fig.cap = ""}```ka
inoremap `t ```{r tab.id = "table:call TabNum()a=g:rtab", ft.keepnext = T}```ka
iabbr cc <<<>>>2h
iabbr kbl knitr::kable(data, format = "markdown", caption = "")b
iabbr pba pbapply::pbapply
iabbr pbm pbapply::pbmapply
iabbr pbs pbapply::pbsapply
iabbr pbl pbapply::pblapply
iabbr asss assign("envir_meta", environment(), parent.env(environment()))
iabbr ffs function()
iabbr ff function(){}i?(
iabbr mda [annotation]: -----------------------------------------
iabbr ;;; assign("test", , .GlobalEnv)F,i
iabbr ii %in%
iabbr pp %>%
iabbr vv <-
iabbr fps - 图\@ref(fig:)注：bb
iabbr ldt <!---BLOCK_TOC{seq_id: 'tab'}--->
iabbr ldf <!---BLOCK_TOC{seq_id: 'fig'}--->
iabbr ldc <!---BLOCK_TOC--->
iabbr lds <!---BLOCK_LANDSCAPE_START---><!---BLOCK_LANDSCAPE_STOP--->k
iabbr rtb \@ref(tab:)F xf)
iabbr rfg \@ref(fig:)F xf)
iabbr htimg <center><img src="" width="100%"></center>^f"
iabbr ll \flushleft
iabbr rr \flushright
iabbr inccn \includegraphics{}
iabbr inccw \includegraphics[width=135mm]{}
iabbr incc \includegraphics[height=65mm]{}
iabbr txtc \textcolor{}{}b
iabbr mdcol. ::: {.col data-latex="{0.05\textwidth}"} :::bik
iabbr mdcol3 ::: {.col data-latex="{0.3\textwidth}"} :::bik
iabbr mdcol4 ::: {.col data-latex="{0.4\textwidth}"} :::bik
iabbr mdcol1 ::: {.col data-latex="{0.1\textwidth}"} :::bik
iabbr mdcol6 ::: {.col data-latex="{0.6\textwidth}"} :::bik
iabbr mdcol5 ::: {.col data-latex="{0.5\textwidth}"} :::bik
iabbr mdcols :::::: {.cols data-latex=""} ::::::bik
iabbr docd []{.deletion}bba
iabbr doci []{.insertion}bba
iabbr ttbl {@tbl:}{nolink=True}4ba
iabbr ffgr {@fig:}{nolink=True}4ba
iabbr mdc [citation]:
iabbr nsp &ensp;&ensp;
iabbr msp &emsp;&emsp;
iabbr mdi ## [introduction]
iabbr fgr \@ref(fig:)<Left>
iabbr stf ## @figure
iabbr ctae ## $start_________________________
iabbr ctas ## ^start_________________________
iabbr ctr ## ========== Run block ==========
iabbr spp ::: {.col data-latex="{0.02\textwidth}"}\hspace{1pt}:::
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set background=dark
set backspace=indent,eol,start
set completeopt=menuone
set cpoptions=aAceFsB
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set guifont=Monospace\ 16
set guioptions=aegirLt
set helplang=en
set laststatus=2
set linespace=10
set path=.,/usr/include,,,~/outline/**,~/MCnebula2/**,~/.vim/after/ftplugin/**
set printoptions=paper:a4
set ruler
set runtimepath=~/.vim,~/.vim/bundle/Vundle.vim,~/.vim/bundle/nerdtree,~/.vim/bundle/vim-startify,~/.vim/bundle/auto-pairs,~/.vim/bundle/vim-gotham,~/.vim/bundle/tabular,~/.vim/bundle/vimtex,~/.vim/bundle/nerdcommenter,~/.vim/bundle/YouCompleteMe,~/.vim/bundle/ale,~/.vim/bundle/Nvim-R,~/.vim/bundle/vim-unimpaired,~/.vim/bundle/vim-translator,~/.vim/bundle/tagbar,~/.vim/bundle/ZFVimIM,~/.vim/bundle/ZFVimJob,~/.vim/bundle/ZFVimIM_openapi,~/.vim/bundle/vim-anyfold,~/.vim/bundle/vim-floaterm,~/.vim/bundle/pandoc-complete,~/.vim/bundle/LeaderF,/var/lib/vim/addons,/etc/vim,/usr/share/vim/vimfiles,/usr/share/vim/vim82,/usr/share/vim/vimfiles/after,/etc/vim/after,/var/lib/vim/addons/after,~/.vim/after,~/.vim/bundle/Vundle.vim,~/.vim/bundle/Vundle.vim/after,~/.vim/bundle/nerdtree/after,~/.vim/bundle/vim-startify/after,~/.vim/bundle/auto-pairs/after,~/.vim/bundle/vim-gotham/after,~/.vim/bundle/tabular/after,~/.vim/bundle/vimtex/after,~/.vim/bundle/nerdcommenter/after,~/.vim/bundle/YouCompleteMe/after,~/.vim/bundle/ale/after,~/.vim/bundle/Nvim-R/after,~/.vim/bundle/vim-unimpaired/after,~/.vim/bundle/vim-translator/after,~/.vim/bundle/tagbar/after,~/.vim/bundle/ZFVimIM/after,~/.vim/bundle/ZFVimJob/after,~/.vim/bundle/ZFVimIM_openapi/after,~/.vim/bundle/vim-anyfold/after,~/.vim/bundle/vim-floaterm/after,~/.vim/bundle/pandoc-complete/after,~/.vim/bundle/LeaderF/after
set scrolloff=5
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize
set shiftwidth=2
set shortmess=filnxtToOSIc
set smartindent
set softtabstop=2
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set switchbuf=useopen
set tabstop=2
set visualbell
set wildmode=longest,list
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/report/reports
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd slidy_1.Rmd
$argadd render.R
edit slidy_1.Rmd
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <M-n> :call AutoPairsJump()a
inoremap <buffer> <silent> <expr> <M-p> AutoPairsToggle()
inoremap <buffer> <silent> <M-b> =AutoPairsBackInsert()
inoremap <buffer> <silent> <M-e> =AutoPairsFastWrap()
inoremap <buffer> <silent> <C-H> =AutoPairsDelete()
inoremap <buffer> <silent> <BS> =AutoPairsDelete()
inoremap <buffer> <silent> <M-'> =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> <M-"> =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> <M-}> =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> <M-{> =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> <M-]> =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> <M-[> =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> <M-)> =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> <M-(> =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> § =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> ¢ =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> © =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> ¨ =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> î :call AutoPairsJump()a
inoremap <buffer> <silent> <expr> ð AutoPairsToggle()
inoremap <buffer> <silent> â =AutoPairsBackInsert()
inoremap <buffer> <silent> å =AutoPairsFastWrap()
inoremap <buffer> <silent> ý =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> û =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> Ý =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
vnoremap <buffer> <silent> \kn :call RKnit()
vnoremap <buffer> <silent> \rd :call RSetWD()
vnoremap <buffer> <silent> \ko :call RMakeRmd("odt_document")
vnoremap <buffer> <silent> \kh :call RMakeRmd("html_document")
vnoremap <buffer> <silent> \kw :call RMakeRmd("word_document")
vnoremap <buffer> <silent> \kl :call RMakeRmd("beamer_presentation")
vnoremap <buffer> <silent> \kp :call RMakeRmd("pdf_document")
vnoremap <buffer> <silent> \ka :call RMakeRmd("all")
vnoremap <buffer> <silent> \kr :call RMakeRmd("default")
vnoremap <buffer> <silent> \r- :call RBrOpenCloseLs("C")
vnoremap <buffer> <silent> \r= :call RBrOpenCloseLs("O")
vnoremap <buffer> <silent> \ro :call RObjBrowser()
vnoremap <buffer> <silent> \rb :call RAction("plotsumm", "v")
vnoremap <buffer> <silent> \rg :call RAction("plot", "v")
vnoremap <buffer> <silent> \rs :call RAction("summary", "v")
vnoremap <buffer> <silent> \rh :call RAction("help")
vnoremap <buffer> <silent> \re :call RAction("example")
vnoremap <buffer> <silent> \ra :call RAction("args")
vnoremap <buffer> <silent> \td :call RAction("dputtab", "v")
vnoremap <buffer> <silent> \vh :call RAction("viewobj", "v", ", howto='above 7split', nrows=6")
vnoremap <buffer> <silent> \vv :call RAction("viewobj", "v", ", howto='vsplit'")
vnoremap <buffer> <silent> \vs :call RAction("viewobj", "v", ", howto='split'")
vnoremap <buffer> <silent> \rv :call RAction("viewobj", "v")
vnoremap <buffer> <silent> \rt :call RAction("str", "v")
vnoremap <buffer> <silent> \rn :call RAction("nvim.names", "v")
vnoremap <buffer> <silent> \rp :call RAction("print", "v")
vnoremap <buffer> <silent> \rm :call RClearAll()
vnoremap <buffer> <silent> \rr :call RClearConsole()
vnoremap <buffer> <silent> \rl :call g:SendCmdToR("ls()")
vnoremap <buffer> <silent> \o :call RWarningMsg("This command does not work over a selection of lines.")
vnoremap <buffer> <silent> \sa :call SendSelectionToR("echo", "down")
vnoremap <buffer> <silent> \sd :call SendSelectionToR("silent", "down")
vnoremap <buffer> <silent> \se :call SendSelectionToR("echo", "stay")
vnoremap <buffer> <silent> \ss :call SendSelectionToR("silent", "stay")
vnoremap <buffer> <silent> \fa :call SendFunctionToR("echo", "down")
vnoremap <buffer> <silent> \fd :call SendFunctionToR("silent", "down")
vnoremap <buffer> <silent> \fe :call SendFunctionToR("echo", "stay")
vnoremap <buffer> <silent> \ff :call SendFunctionToR("silent", "stay")
vnoremap <buffer> <silent> \rw :call RQuit('save')
vnoremap <buffer> <silent> \rq :call RQuit('nosave')
vnoremap <buffer> <silent> \rc :call StartR("custom")
vnoremap <buffer> <silent> \rf :call StartR("R")
nnoremap <buffer> <silent> \rf :call StartR("R")
onoremap <buffer> <silent> \rf :call StartR("R")
nnoremap <buffer> <silent> \rc :call StartR("custom")
onoremap <buffer> <silent> \rc :call StartR("custom")
nnoremap <buffer> <silent> \rq :call RQuit('nosave')
onoremap <buffer> <silent> \rq :call RQuit('nosave')
nnoremap <buffer> <silent> \rw :call RQuit('save')
onoremap <buffer> <silent> \rw :call RQuit('save')
nnoremap <buffer> <silent> \ff :call SendFunctionToR("silent", "stay")
onoremap <buffer> <silent> \ff :call SendFunctionToR("silent", "stay")
nnoremap <buffer> <silent> \fe :call SendFunctionToR("echo", "stay")
onoremap <buffer> <silent> \fe :call SendFunctionToR("echo", "stay")
nnoremap <buffer> <silent> \fd :call SendFunctionToR("silent", "down")
onoremap <buffer> <silent> \fd :call SendFunctionToR("silent", "down")
nnoremap <buffer> <silent> \fa :call SendFunctionToR("echo", "down")
onoremap <buffer> <silent> \fa :call SendFunctionToR("echo", "down")
nnoremap <buffer> <silent> \ss :call SendSelectionToR("silent", "stay", "normal")
onoremap <buffer> <silent> \ss :call SendSelectionToR("silent", "stay", "normal")
nnoremap <buffer> <silent> \se :call SendSelectionToR("echo", "stay", "normal")
onoremap <buffer> <silent> \se :call SendSelectionToR("echo", "stay", "normal")
nnoremap <buffer> <silent> \sd :call SendSelectionToR("silent", "down", "normal")
onoremap <buffer> <silent> \sd :call SendSelectionToR("silent", "down", "normal")
nnoremap <buffer> <silent> \sa :call SendSelectionToR("echo", "down", "normal")
onoremap <buffer> <silent> \sa :call SendSelectionToR("echo", "down", "normal")
nnoremap <buffer> <silent> \o :call SendLineToRAndInsertOutput()0
onoremap <buffer> <silent> \o :call SendLineToRAndInsertOutput()0
nnoremap <buffer> <silent> \rl :call g:SendCmdToR("ls()")
onoremap <buffer> <silent> \rl :call g:SendCmdToR("ls()")
nnoremap <buffer> <silent> \rr :call RClearConsole()
onoremap <buffer> <silent> \rr :call RClearConsole()
nnoremap <buffer> <silent> \rm :call RClearAll()
onoremap <buffer> <silent> \rm :call RClearAll()
nnoremap <buffer> <silent> \rp :call RAction("print")
onoremap <buffer> <silent> \rp :call RAction("print")
nnoremap <buffer> <silent> \rn :call RAction("nvim.names")
onoremap <buffer> <silent> \rn :call RAction("nvim.names")
nnoremap <buffer> <silent> \rt :call RAction("str")
onoremap <buffer> <silent> \rt :call RAction("str")
nnoremap <buffer> <silent> \rv :call RAction("viewobj")
onoremap <buffer> <silent> \rv :call RAction("viewobj")
nnoremap <buffer> <silent> \vs :call RAction("viewobj", ", howto='split'")
onoremap <buffer> <silent> \vs :call RAction("viewobj", ", howto='split'")
nnoremap <buffer> <silent> \vv :call RAction("viewobj", ", howto='vsplit'")
onoremap <buffer> <silent> \vv :call RAction("viewobj", ", howto='vsplit'")
nnoremap <buffer> <silent> \vh :call RAction("viewobj", ", howto='above 7split', nrows=6")
onoremap <buffer> <silent> \vh :call RAction("viewobj", ", howto='above 7split', nrows=6")
nnoremap <buffer> <silent> \td :call RAction("dputtab")
onoremap <buffer> <silent> \td :call RAction("dputtab")
nnoremap <buffer> <silent> \ra :call RAction("args")
onoremap <buffer> <silent> \ra :call RAction("args")
nnoremap <buffer> <silent> \re :call RAction("example")
onoremap <buffer> <silent> \re :call RAction("example")
nnoremap <buffer> <silent> \rh :call RAction("help")
onoremap <buffer> <silent> \rh :call RAction("help")
nnoremap <buffer> <silent> \rs :call RAction("summary")
onoremap <buffer> <silent> \rs :call RAction("summary")
nnoremap <buffer> <silent> \rg :call RAction("plot")
onoremap <buffer> <silent> \rg :call RAction("plot")
nnoremap <buffer> <silent> \rb :call RAction("plotsumm")
onoremap <buffer> <silent> \rb :call RAction("plotsumm")
nnoremap <buffer> <silent> \ro :call RObjBrowser()
onoremap <buffer> <silent> \ro :call RObjBrowser()
nnoremap <buffer> <silent> \r= :call RBrOpenCloseLs("O")
onoremap <buffer> <silent> \r= :call RBrOpenCloseLs("O")
nnoremap <buffer> <silent> \r- :call RBrOpenCloseLs("C")
onoremap <buffer> <silent> \r- :call RBrOpenCloseLs("C")
nnoremap <buffer> <silent> \kr :call RMakeRmd("default")
onoremap <buffer> <silent> \kr :call RMakeRmd("default")
nnoremap <buffer> <silent> \ka :call RMakeRmd("all")
onoremap <buffer> <silent> \ka :call RMakeRmd("all")
nnoremap <buffer> <silent> \kp :call RMakeRmd("pdf_document")
onoremap <buffer> <silent> \kp :call RMakeRmd("pdf_document")
nnoremap <buffer> <silent> \kl :call RMakeRmd("beamer_presentation")
onoremap <buffer> <silent> \kl :call RMakeRmd("beamer_presentation")
nnoremap <buffer> <silent> \kw :call RMakeRmd("word_document")
onoremap <buffer> <silent> \kw :call RMakeRmd("word_document")
nnoremap <buffer> <silent> \kh :call RMakeRmd("html_document")
onoremap <buffer> <silent> \kh :call RMakeRmd("html_document")
nnoremap <buffer> <silent> \ko :call RMakeRmd("odt_document")
onoremap <buffer> <silent> \ko :call RMakeRmd("odt_document")
nnoremap <buffer> <silent> \rd :call RSetWD()
onoremap <buffer> <silent> \rd :call RSetWD()
nnoremap <buffer> <silent> \kn :call RKnit()
onoremap <buffer> <silent> \kn :call RKnit()
noremap <buffer> <silent> \gN :call b:PreviousRChunk()
noremap <buffer> <silent> \gn :call b:NextRChunk()
noremap <buffer> <silent> \ca :call b:SendChunkToR("echo", "down")
noremap <buffer> <silent> \cd :call b:SendChunkToR("silent", "down")
noremap <buffer> <silent> \ce :call b:SendChunkToR("echo", "stay")
noremap <buffer> <silent> \cc :call b:SendChunkToR("silent", "stay")
noremap <buffer> <silent> \ud :call RAction("undebug")
noremap <buffer> <silent> \bg :call RAction("debug")
noremap <buffer> <silent> \r<Right> :call RSendPartOfLine("right", 0)
noremap <buffer> <silent> \r<Left> :call RSendPartOfLine("left", 0)
noremap <buffer> <silent> \m :set opfunc=SendMotionToRg@
noremap <buffer> <silent> \d :call SendLineToR("down")0
noremap <buffer> <silent> \l :call SendLineToR("stay")
noremap <buffer> <silent> \ch :call SendFHChunkToR()
noremap <buffer> <silent> \pa :call SendParagraphToR("echo", "down")
noremap <buffer> <silent> \pd :call SendParagraphToR("silent", "down")
noremap <buffer> <silent> \pe :call SendParagraphToR("echo", "stay")
noremap <buffer> <silent> \pp :call SendParagraphToR("silent", "stay")
vnoremap <buffer> <silent> \so :call SendSelectionToR("echo", "stay", "NewtabInsert")
noremap <buffer> <silent> \ba :call SendMBlockToR("echo", "down")
noremap <buffer> <silent> \bd :call SendMBlockToR("silent", "down")
noremap <buffer> <silent> \be :call SendMBlockToR("echo", "stay")
noremap <buffer> <silent> \bb :call SendMBlockToR("silent", "stay")
vnoremap <buffer> <silent> <Plug>RKnit :call RKnit()
vnoremap <buffer> <silent> <Plug>RSetwd :call RSetWD()
vnoremap <buffer> <silent> <Plug>RMakeODT :call RMakeRmd("odt_document")
vnoremap <buffer> <silent> <Plug>RMakeHTML :call RMakeRmd("html_document")
vnoremap <buffer> <silent> <Plug>RMakeWord :call RMakeRmd("word_document")
vnoremap <buffer> <silent> <Plug>RMakePDFKb :call RMakeRmd("beamer_presentation")
vnoremap <buffer> <silent> <Plug>RMakePDFK :call RMakeRmd("pdf_document")
vnoremap <buffer> <silent> <Plug>RMakeAll :call RMakeRmd("all")
vnoremap <buffer> <silent> <Plug>RMakeRmd :call RMakeRmd("default")
vnoremap <buffer> <silent> <Plug>RCloseLists :call RBrOpenCloseLs("C")
vnoremap <buffer> <silent> <Plug>ROpenLists :call RBrOpenCloseLs("O")
vnoremap <buffer> <silent> <Plug>RUpdateObjBrowser :call RObjBrowser()
vnoremap <buffer> <silent> <Plug>RSPlot :call RAction("plotsumm", "v")
vnoremap <buffer> <silent> <Plug>RPlot :call RAction("plot", "v")
vnoremap <buffer> <silent> <Plug>RSummary :call RAction("summary", "v")
vnoremap <buffer> <silent> <Plug>RHelp :call RAction("help")
vnoremap <buffer> <silent> <Plug>RShowEx :call RAction("example")
vnoremap <buffer> <silent> <Plug>RShowArgs :call RAction("args")
vnoremap <buffer> <silent> <Plug>RDputObj :call RAction("dputtab", "v")
vnoremap <buffer> <silent> <Plug>RViewDFa :call RAction("viewobj", "v", ", howto='above 7split', nrows=6")
vnoremap <buffer> <silent> <Plug>RViewDFv :call RAction("viewobj", "v", ", howto='vsplit'")
vnoremap <buffer> <silent> <Plug>RViewDFs :call RAction("viewobj", "v", ", howto='split'")
vnoremap <buffer> <silent> <Plug>RViewDF :call RAction("viewobj", "v")
vnoremap <buffer> <silent> <Plug>RObjectStr :call RAction("str", "v")
vnoremap <buffer> <silent> <Plug>RObjectNames :call RAction("nvim.names", "v")
vnoremap <buffer> <silent> <Plug>RObjectPr :call RAction("print", "v")
vnoremap <buffer> <silent> <Plug>RClearAll :call RClearAll()
vnoremap <buffer> <silent> <Plug>RClearConsole :call RClearConsole()
vnoremap <buffer> <silent> <Plug>RListSpace :call g:SendCmdToR("ls()")
vnoremap <buffer> <silent> <Plug>(RDSendLineAndInsertOutput) :call RWarningMsg("This command does not work over a selection of lines.")
vnoremap <buffer> <silent> <Plug>REDSendSelection :call SendSelectionToR("echo", "down")
vnoremap <buffer> <silent> <Plug>RDSendSelection :call SendSelectionToR("silent", "down")
vnoremap <buffer> <silent> <Plug>RESendSelection :call SendSelectionToR("echo", "stay")
vnoremap <buffer> <silent> <Plug>RSendSelection :call SendSelectionToR("silent", "stay")
vnoremap <buffer> <silent> <Plug>RDSendFunction :call SendFunctionToR("echo", "down")
nnoremap <buffer> <silent> <Plug>RDSendFunction :call SendFunctionToR("echo", "down")
onoremap <buffer> <silent> <Plug>RDSendFunction :call SendFunctionToR("echo", "down")
vnoremap <buffer> <silent> <Plug>RSendFunction :call SendFunctionToR("silent", "stay")
vnoremap <buffer> <silent> <Plug>RSaveClose :call RQuit('save')
vnoremap <buffer> <silent> <Plug>RClose :call RQuit('nosave')
vnoremap <buffer> <silent> <Plug>RCustomStart :call StartR("custom")
vnoremap <buffer> <silent> <Plug>RStart :call StartR("R")
nnoremap <buffer> <silent> <Plug>RStart :call StartR("R")
onoremap <buffer> <silent> <Plug>RStart :call StartR("R")
nnoremap <buffer> <silent> <Plug>RCustomStart :call StartR("custom")
onoremap <buffer> <silent> <Plug>RCustomStart :call StartR("custom")
nnoremap <buffer> <silent> <Plug>RClose :call RQuit('nosave')
onoremap <buffer> <silent> <Plug>RClose :call RQuit('nosave')
nnoremap <buffer> <silent> <Plug>RSaveClose :call RQuit('save')
onoremap <buffer> <silent> <Plug>RSaveClose :call RQuit('save')
nnoremap <buffer> <silent> <Plug>RSendFunction :call SendFunctionToR("silent", "stay")
onoremap <buffer> <silent> <Plug>RSendFunction :call SendFunctionToR("silent", "stay")
nnoremap <buffer> <silent> <Plug>RSendSelection :call SendSelectionToR("silent", "stay", "normal")
onoremap <buffer> <silent> <Plug>RSendSelection :call SendSelectionToR("silent", "stay", "normal")
nnoremap <buffer> <silent> <Plug>RESendSelection :call SendSelectionToR("echo", "stay", "normal")
onoremap <buffer> <silent> <Plug>RESendSelection :call SendSelectionToR("echo", "stay", "normal")
nnoremap <buffer> <silent> <Plug>RDSendSelection :call SendSelectionToR("silent", "down", "normal")
onoremap <buffer> <silent> <Plug>RDSendSelection :call SendSelectionToR("silent", "down", "normal")
nnoremap <buffer> <silent> <Plug>REDSendSelection :call SendSelectionToR("echo", "down", "normal")
onoremap <buffer> <silent> <Plug>REDSendSelection :call SendSelectionToR("echo", "down", "normal")
nnoremap <buffer> <silent> <Plug>(RDSendLineAndInsertOutput) :call SendLineToRAndInsertOutput()0
onoremap <buffer> <silent> <Plug>(RDSendLineAndInsertOutput) :call SendLineToRAndInsertOutput()0
nnoremap <buffer> <silent> <Plug>RListSpace :call g:SendCmdToR("ls()")
onoremap <buffer> <silent> <Plug>RListSpace :call g:SendCmdToR("ls()")
nnoremap <buffer> <silent> <Plug>RClearConsole :call RClearConsole()
onoremap <buffer> <silent> <Plug>RClearConsole :call RClearConsole()
nnoremap <buffer> <silent> <Plug>RClearAll :call RClearAll()
onoremap <buffer> <silent> <Plug>RClearAll :call RClearAll()
nnoremap <buffer> <silent> <Plug>RObjectPr :call RAction("print")
onoremap <buffer> <silent> <Plug>RObjectPr :call RAction("print")
nnoremap <buffer> <silent> <Plug>RObjectNames :call RAction("nvim.names")
onoremap <buffer> <silent> <Plug>RObjectNames :call RAction("nvim.names")
nnoremap <buffer> <silent> <Plug>RObjectStr :call RAction("str")
onoremap <buffer> <silent> <Plug>RObjectStr :call RAction("str")
nnoremap <buffer> <silent> <Plug>RViewDF :call RAction("viewobj")
onoremap <buffer> <silent> <Plug>RViewDF :call RAction("viewobj")
nnoremap <buffer> <silent> <Plug>RViewDFs :call RAction("viewobj", ", howto='split'")
onoremap <buffer> <silent> <Plug>RViewDFs :call RAction("viewobj", ", howto='split'")
nnoremap <buffer> <silent> <Plug>RViewDFv :call RAction("viewobj", ", howto='vsplit'")
onoremap <buffer> <silent> <Plug>RViewDFv :call RAction("viewobj", ", howto='vsplit'")
nnoremap <buffer> <silent> <Plug>RViewDFa :call RAction("viewobj", ", howto='above 7split', nrows=6")
onoremap <buffer> <silent> <Plug>RViewDFa :call RAction("viewobj", ", howto='above 7split', nrows=6")
nnoremap <buffer> <silent> <Plug>RDputObj :call RAction("dputtab")
onoremap <buffer> <silent> <Plug>RDputObj :call RAction("dputtab")
nnoremap <buffer> <silent> <Plug>RShowArgs :call RAction("args")
onoremap <buffer> <silent> <Plug>RShowArgs :call RAction("args")
nnoremap <buffer> <silent> <Plug>RShowEx :call RAction("example")
onoremap <buffer> <silent> <Plug>RShowEx :call RAction("example")
nnoremap <buffer> <silent> <Plug>RHelp :call RAction("help")
onoremap <buffer> <silent> <Plug>RHelp :call RAction("help")
nnoremap <buffer> <silent> <Plug>RSummary :call RAction("summary")
onoremap <buffer> <silent> <Plug>RSummary :call RAction("summary")
nnoremap <buffer> <silent> <Plug>RPlot :call RAction("plot")
onoremap <buffer> <silent> <Plug>RPlot :call RAction("plot")
nnoremap <buffer> <silent> <Plug>RSPlot :call RAction("plotsumm")
onoremap <buffer> <silent> <Plug>RSPlot :call RAction("plotsumm")
nnoremap <buffer> <silent> <Plug>RUpdateObjBrowser :call RObjBrowser()
onoremap <buffer> <silent> <Plug>RUpdateObjBrowser :call RObjBrowser()
nnoremap <buffer> <silent> <Plug>ROpenLists :call RBrOpenCloseLs("O")
onoremap <buffer> <silent> <Plug>ROpenLists :call RBrOpenCloseLs("O")
nnoremap <buffer> <silent> <Plug>RCloseLists :call RBrOpenCloseLs("C")
onoremap <buffer> <silent> <Plug>RCloseLists :call RBrOpenCloseLs("C")
nnoremap <buffer> <silent> <Plug>RMakeRmd :call RMakeRmd("default")
onoremap <buffer> <silent> <Plug>RMakeRmd :call RMakeRmd("default")
nnoremap <buffer> <silent> <Plug>RMakeAll :call RMakeRmd("all")
onoremap <buffer> <silent> <Plug>RMakeAll :call RMakeRmd("all")
nnoremap <buffer> <silent> <Plug>RMakePDFK :call RMakeRmd("pdf_document")
onoremap <buffer> <silent> <Plug>RMakePDFK :call RMakeRmd("pdf_document")
nnoremap <buffer> <silent> <Plug>RMakePDFKb :call RMakeRmd("beamer_presentation")
onoremap <buffer> <silent> <Plug>RMakePDFKb :call RMakeRmd("beamer_presentation")
nnoremap <buffer> <silent> <Plug>RMakeWord :call RMakeRmd("word_document")
onoremap <buffer> <silent> <Plug>RMakeWord :call RMakeRmd("word_document")
nnoremap <buffer> <silent> <Plug>RMakeHTML :call RMakeRmd("html_document")
onoremap <buffer> <silent> <Plug>RMakeHTML :call RMakeRmd("html_document")
nnoremap <buffer> <silent> <Plug>RMakeODT :call RMakeRmd("odt_document")
onoremap <buffer> <silent> <Plug>RMakeODT :call RMakeRmd("odt_document")
nnoremap <buffer> <silent> <Plug>RSetwd :call RSetWD()
onoremap <buffer> <silent> <Plug>RSetwd :call RSetWD()
nnoremap <buffer> <silent> <Plug>RKnit :call RKnit()
onoremap <buffer> <silent> <Plug>RKnit :call RKnit()
noremap <buffer> <silent> <M-n> :call AutoPairsJump()
noremap <buffer> <silent> <M-p> :call AutoPairsToggle()
noremap <buffer> <silent> <Plug>RPreviousRChunk :call b:PreviousRChunk()
noremap <buffer> <silent> <Plug>RNextRChunk :call b:NextRChunk()
noremap <buffer> <silent> <Plug>REDSendChunk :call b:SendChunkToR("echo", "down")
noremap <buffer> <silent> <Plug>RDSendChunk :call b:SendChunkToR("silent", "down")
noremap <buffer> <silent> <Plug>RESendChunk :call b:SendChunkToR("echo", "stay")
noremap <buffer> <silent> <Plug>RSendChunk :call b:SendChunkToR("silent", "stay")
noremap <buffer> <silent> <Plug>RUndebug :call RAction("undebug")
noremap <buffer> <silent> <Plug>RDebug :call RAction("debug")
noremap <buffer> <silent> <Plug>RNRightPart :call RSendPartOfLine("right", 0)
noremap <buffer> <silent> <Plug>RNLeftPart :call RSendPartOfLine("left", 0)
noremap <buffer> <silent> <Plug>RSendMotion :set opfunc=SendMotionToRg@
noremap <buffer> <silent> <Plug>RDSendLine :call SendLineToR("down")0
noremap <buffer> <silent> <Plug>RSendLine :call SendLineToR("stay")
noremap <buffer> <silent> <Plug>RSendChunkFH :call SendFHChunkToR()
noremap <buffer> <silent> <Plug>REDSendParagraph :call SendParagraphToR("echo", "down")
noremap <buffer> <silent> <Plug>RDSendParagraph :call SendParagraphToR("silent", "down")
noremap <buffer> <silent> <Plug>RESendParagraph :call SendParagraphToR("echo", "stay")
noremap <buffer> <silent> <Plug>RSendParagraph :call SendParagraphToR("silent", "stay")
vnoremap <buffer> <silent> <Plug>RSendSelAndInsertOutput :call SendSelectionToR("echo", "stay", "NewtabInsert")
noremap <buffer> <silent> <Plug>REDSendMBlock :call SendMBlockToR("echo", "down")
noremap <buffer> <silent> <Plug>RDSendMBlock :call SendMBlockToR("silent", "down")
noremap <buffer> <silent> <Plug>RESendMBlock :call SendMBlockToR("echo", "stay")
noremap <buffer> <silent> <Plug>RSendMBlock :call SendMBlockToR("silent", "stay")
inoremap <buffer> <silent>  =AutoPairsDelete()
inoremap <buffer> <silent>   =AutoPairsSpace()
inoremap <buffer> <silent> " =AutoPairsInsert('"')
inoremap <buffer> <silent> ' =AutoPairsInsert('''')
inoremap <buffer> <silent> ( =AutoPairsInsert('(')
inoremap <buffer> <silent> ) =AutoPairsInsert(')')
noremap <buffer> <silent> î :call AutoPairsJump()
noremap <buffer> <silent> ð :call AutoPairsToggle()
inoremap <buffer> <silent> [ =AutoPairsInsert('[')
inoremap <buffer> <silent> ] =AutoPairsInsert(']')
inoremap <buffer> <silent> _ :call ReplaceUnderS()a
inoremap <buffer> <silent> ` :call RWriteRmdChunk()a
inoremap <buffer> <silent> { =AutoPairsInsert('{')
inoremap <buffer> <silent> } =AutoPairsInsert('}')
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#',:###,:##,:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
set cursorline
setlocal cursorline
setlocal cursorlineopt=both
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'rmd'
setlocal filetype=rmd
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=FormatRmd()
setlocal formatoptions=tcqln
setlocal formatlistpat=^\\s*\\d\\+\\.\\s\\+\\|^\\s*[-*+]\\s\\+
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetRmdIndent()
setlocal indentkeys=0{,0},<:>,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,.
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal listchars=
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=CompleteR
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=2
setlocal noshortname
setlocal showbreak=
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal smartindent
setlocal softtabstop=2
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'rmd'
setlocal syntax=rmd
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tagfunc=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal thesaurusfunc=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal virtualedit=
setlocal wincolor=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let &fdl = &fdl
let s:l = 242 - ((14 * winheight(0) + 10) / 20)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 242
normal! 03|
tabnext 1
badd +144 slidy_1.Rmd
badd +1 ~/utils.tool/inst/extdata/library.bib
badd +58 ~/.vim/after/ftplugin/install.R
badd +1 render.R
badd +46 ~/.vim/after/ftplugin/r.vim
badd +17 ~/.vim/after/ftplugin/rmd.vim
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOSIc
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
