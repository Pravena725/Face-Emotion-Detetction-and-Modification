function [BW,maskedImage] = segmentImage_sad(sad_lip_RGB)
%segmentImage Segment image using auto-generated code from imageSegmenter app
%  [BW,MASKEDIMAGE] = segmentImage(RGB) segments image RGB using
%  auto-generated code from the imageSegmenter app. The final segmentation
%  is returned in BW, and a masked image is returned in MASKEDIMAGE.

% Auto-generated by imageSegmenter app on 17-Apr-2021
%----------------------------------------------------


% Convert RGB image into L*a*b* color space.
X = rgb2lab(sad_lip_RGB);

% Graph cut
foregroundInd = [8640 8813 8814 8986 8987 8988 9159 9161 9329 9331 9332 9335 9503 9505 9676 9677 9678 9850 9851 9857 10024 10197 10370 10378 10543 10544 10717 10890 10900 11063 11073 11235 11409 11410 11421 11755 11928 11941 12101 12274 12447 12448 12620 12637 12793 12794 12966 12984 13139 13157 13312 13331 13505 13658 13679 14005 14028 14178 14202 14351 14524 14551 14697 14725 14870 14899 15074 15216 15248 15249 15423 15562 15597 15772 15946 16082 16121 16255 16295 16470 16602 16774 16819 16948 16994 17121 17294 17342 17343 17468 17641 17692 17987 18040 18160 18215 18333 18506 18564 18679 18740 18852 19088 19089 19371 19372 19438 19718 19786 20237 20310 20484 20583 20659 20756 21007 21008 21101 21274 21357 21447 21531 21621 21705 21794 21967 22054 22140 22141 22313 22403 22486 22487 22752 22833 23007 23180 23354 23450 23527 23700 23874 24047 24048 24147 24220 24394 24567 24843 24914 25088 25261 25366 25434 25608 25781 25955 26128 26236 26475 26583 26584 26648 26758 26822 26932 26995 27106 27280 27343 27454 27517 27691 27802 27864 28038 28150 28211 28385 28673 28733 29081 29196 29429 29603 29893 29951 30125 30473 30647 30765 30821 30995 31113 31169 31288 31344 31462 31692 31810 31867 31984 32215 32507 32564 32913 33029 33262 33377 33437 33725 33786 34135 34136 34247 34484 34485 34596 34770 34833 34944 35118 35182 35466 35530 35640 35705 35879 35988 36162 36228 36402 36684 36750 36925 37032 37099 37273 37448 37554 37622 37796 38145 38319 38424 38667 39016 39294 39364 39538 39816 39886 40234 40338 40582 40685 40756 40859 41033 41103 41207 41276 41449 41796 42143 42252 42316 42489 42600 42663 42836 42948 43010 43183 43356 43357 43470 43529 43818 44050 44340 44397 44570 44688 44743 44744 45091 45265 45383 45612 45905 46133 46253 46307 46601 46655 46775 46829 47003 47122 47177 47351 47643 47875 47991 48164 48224 48512 48685 48923 49033 49207 49447 49555 49728 49971 50076 50146 50249 50320 50495 50597 50670 50844 50945 51193 51368 51640 51717 51988 52066 52240 52335 52589 52683 52763 52857 53030 53112 53204 53461 53552 53635 53810 53900 53984 54334 54768 54859 55115 55289 55558 55983 56083 56433 56677 57131 57197 57306 57544 57654 57655 57891 58178 58238 58585 58702 58758 59105 59226 59278 59401 59451 59625 59750 59798 59925 59972 60099 60274 60319 60449 60667 60971 61014 61187 61361 61669 61708 62055 62192 62403 62576 62716 62750 62923 63239 63271 63618 63763 63938 63966 64112 64313 64461 64487 64661 64810 64835 64984 65009 65158 65183 65333 65357 65531 65682 65706 65858 66033 66054 66208 66229 66383 66403 66404 66558 66578 66732 66733 66753 66908 66927 67084 67101 67275 67434 67449 67609 67785 67799 67960 67961 67973 68135 68147 68310 68321 68485 68495 68669 68834 69009 69010 69017 69185 69191 69360 69361 69362 69365 69536 69537 69538 69539 ];
backgroundInd = [2471 2907 2910 2913 2916 2918 3095 3248 3272 3273 3417 3448 3587 3624 3929 3974 4323 4446 4498 4673 4755 4756 4788 4790 4791 4792 4848 4928 4960 5100 5104 5132 5196 5245 5272 5300 5303 5451 5645 5718 5940 5962 5989 6066 6306 6490 6509 6587 6808 6825 6853 6934 7503 7516 7529 7547 7629 7851 8066 8149 8199 8207 8393 8546 8669 8720 8722 8724 8758 9189 9277 9950 10057 10142 10578 10815 10925 11179 11272 11334 11446 11621 11796 11811 11813 11976 11980 11983 11988 12027 12044 12338 12374 12389 12547 12565 12720 12739 12861 12894 12905 13072 13087 13210 13435 13732 14080 14479 14601 14827 15122 15175 15295 15696 15816 15990 16513 16738 17037 18084 18125 18298 18608 18645 18819 18957 18992 19132 19480 19686 19828 20175 20553 20899 21044 21593 22087 22459 22609 22807 23154 23305 23675 23827 24349 24545 24697 25219 25413 25567 25761 26089 26283 26457 26612 27135 27152 27500 27658 28022 28180 28544 28703 29066 29400 29414 29588 30096 30110 30444 30633 30793 31141 31315 31489 31503 31662 32010 32547 33227 33593 34270 34463 34792 35314 35681 35836 36358 36550 36706 36898 37053 37072 37246 37575 37593 37923 37941 38271 38289 38463 38793 38985 39141 39333 39681 39837 40029 40359 40551 40881 41074 41229 41597 41924 41945 42467 42620 42968 42989 43489 43511 43663 43685 43836 43859 44010 44033 44707 44729 45425 45753 45947 46121 46797 46817 47339 47494 48209 48712 48729 49077 49251 49425 49773 49930 49948 50297 50800 50994 51342 51670 51865 52213 52366 52909 53257 53431 53604 53756 53952 54278 54299 54993 55340 55493 55687 55860 56034 56381 56709 56729 57077 57425 57578 57600 58122 59141 59167 59488 59835 59865 60183 60356 60703 60876 61048 61432 61567 61974 62148 62303 62495 62496 63127 63191 63348 63362 63713 63994 64230 64408 64516 64915 65038 65097 65212 65388 65394 65398 65400 65402 65438 65752 65790 65799 66101 66136 66276 66829 66973 67191 67355 67523 67540 67566 67570 67668 67745 67908 67920 68186 68218 68251 68446 68565 68759 68770 68795 68875 69042 69099 69143 69210 69211 69261 69289 69383 69456 69462 69666 69804 69808 69980 69981 70079 70479 70536 70654 70828 70958 71192 71406 71487 71526 71715 71839 71876 71887 71888 71889 72051 72058 72059 72103 72117 72119 72120 72294 72364 72400 72401 72402 72404 72463 72469 72643 72715 72808 72810 72818 72819 72976 72981 72993 73064 73153 73168 73238 73344 73586 73696 74107 74221 74573 74627 74750 74927 75146 75280 75460 75491 75639 75641 75818 75822 75835 76003 ];
L = superpixels(X,483,'IsInputLab',true);

% Convert L*a*b* range to [0 1]
scaledX = prepLab(X);
BW = lazysnapping(scaledX,L,foregroundInd,backgroundInd);

% Create masked image.
maskedImage = sad_lip_RGB;
maskedImage(repmat(~BW,[1 1 3])) = 0;
end

function out = prepLab(in)

% Convert L*a*b* image to range [0,1]
out = in;
out(:,:,1) = in(:,:,1) / 100;  % L range is [0 100].
out(:,:,2) = (in(:,:,2) + 86.1827) / 184.4170;  % a* range is [-86.1827,98.2343].
out(:,:,3) = (in(:,:,3) + 107.8602) / 202.3382;  % b* range is [-107.8602,94.4780].

end