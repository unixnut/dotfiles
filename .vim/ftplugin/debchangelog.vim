nmap <Leader>dn :call NewVersion()<CR>
nmap <Leader>da :call AddEntry()<CR>
nmap <Leader>dc :call CloseBug()<CR>
" --

nmap <Leader>dU :call Distribution("unstable")<CR>
nmap <Leader>dF :call Distribution("frozen")<CR>
nmap <Leader>dS :call Distribution("stable")<CR>
" --
nmap <Leader>d1 :call Distribution("frozen unstable")<CR>
nmap <Leader>d2 :call Distribution("stable unstable")<CR>
nmap <Leader>d3 :call Distribution("stable frozen")<CR>
nmap <Leader>d4 :call Distribution("stable frozen unstable")<CR>

nmap <Leader>dl :call Urgency("low")<CR>
nmap <Leader>dm :call Urgency("medium")<CR>
nmap <Leader>dh :call Urgency("high")<CR>
" --
nmap <Leader>du :call Unfinalise()<CR>
nmap <Leader>df :call Finalise()<CR>
