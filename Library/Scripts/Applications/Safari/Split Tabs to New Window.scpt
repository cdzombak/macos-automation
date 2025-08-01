FasdUAS 1.101.10   ��   ��    k             l        	  x     �� 
 ��   
 1      ��
�� 
ascr  �� ��
�� 
minv  m         �    2 . 4��       Yosemite (10.10) or later    	 �   4   Y o s e m i t e   ( 1 0 . 1 0 )   o r   l a t e r      x    �� ����    2  	 ��
�� 
osax��        l     ��������  ��  ��        l     ��  ��    � � An AppleScript for Safari to move all tabs in the frontmost window, from the current tab to the rightmost (last) tab, to a new window.     �     A n   A p p l e S c r i p t   f o r   S a f a r i   t o   m o v e   a l l   t a b s   i n   t h e   f r o n t m o s t   w i n d o w ,   f r o m   t h e   c u r r e n t   t a b   t o   t h e   r i g h t m o s t   ( l a s t )   t a b ,   t o   a   n e w   w i n d o w .      l     ��������  ��  ��        l     ��  ��    F @ https://gist.github.com/gruber/eb89728474ba59287df79c054e1097a5     �     �   h t t p s : / / g i s t . g i t h u b . c o m / g r u b e r / e b 8 9 7 2 8 4 7 4 b a 5 9 2 8 7 d f 7 9 c 0 5 4 e 1 0 9 7 a 5   ! " ! l     ��������  ��  ��   "  # $ # l      �� % &��   %nh
Original script: John Gruber (https://daringfireball.net/linked/2023/12/05/an-applescript-for-safari-split-tabs-to-new-window)
Much more elegant version: Leon Cowle (https://github.com/leoncowle)
Even more elegant version: https://stackoverflow.com/questions/54066100/applescript-to-split-safari-tabs-into-new-window/54089865#54089865

Worth a warning: "moving" tabs with this script doesn't actually move them like
drag-and-drop does. The tabs "moved" by this script will reload in the new window,
so you'll lose (a) the current scroll position, and, more dangerously, (b) any
text you've entered in a text field.
    & � ' '� 
 O r i g i n a l   s c r i p t :   J o h n   G r u b e r   ( h t t p s : / / d a r i n g f i r e b a l l . n e t / l i n k e d / 2 0 2 3 / 1 2 / 0 5 / a n - a p p l e s c r i p t - f o r - s a f a r i - s p l i t - t a b s - t o - n e w - w i n d o w ) 
 M u c h   m o r e   e l e g a n t   v e r s i o n :   L e o n   C o w l e   ( h t t p s : / / g i t h u b . c o m / l e o n c o w l e ) 
 E v e n   m o r e   e l e g a n t   v e r s i o n :   h t t p s : / / s t a c k o v e r f l o w . c o m / q u e s t i o n s / 5 4 0 6 6 1 0 0 / a p p l e s c r i p t - t o - s p l i t - s a f a r i - t a b s - i n t o - n e w - w i n d o w / 5 4 0 8 9 8 6 5 # 5 4 0 8 9 8 6 5 
 
 W o r t h   a   w a r n i n g :   " m o v i n g "   t a b s   w i t h   t h i s   s c r i p t   d o e s n ' t   a c t u a l l y   m o v e   t h e m   l i k e 
 d r a g - a n d - d r o p   d o e s .   T h e   t a b s   " m o v e d "   b y   t h i s   s c r i p t   w i l l   r e l o a d   i n   t h e   n e w   w i n d o w , 
 s o   y o u ' l l   l o s e   ( a )   t h e   c u r r e n t   s c r o l l   p o s i t i o n ,   a n d ,   m o r e   d a n g e r o u s l y ,   ( b )   a n y 
 t e x t   y o u ' v e   e n t e r e d   i n   a   t e x t   f i e l d . 
 $  ( ) ( l     ��������  ��  ��   )  *�� * l    Q +���� + O     Q , - , k    P . .  / 0 / r    
 1 2 1 4   �� 3
�� 
cwin 3 m    ����  2 o      ���� 0 original_window   0  4 5 4 r     6 7 6 n     8 9 8 1    ��
�� 
pidx 9 n     : ; : 1    ��
�� 
cTab ; o    ���� 0 original_window   7 o      ���� 0 current_tab_index   5  < = < r     > ? > n     @ A @ 1    ��
�� 
pidx A n     B C B 4   �� D
�� 
bTab D m    ������ C o    ���� 0 original_window   ? o      ���� 0 last_tab_index   =  E F E l   ��������  ��  ��   F  G H G I   #���� I
�� .corecrel****      � null��   I �� J��
�� 
kocl J m    ��
�� 
docu��   H  K L K l  $ $�� M N��   M O I Account for pinned tabs; if we assume index 1, we'll close a pinned tab:    N � O O �   A c c o u n t   f o r   p i n n e d   t a b s ;   i f   w e   a s s u m e   i n d e x   1 ,   w e ' l l   c l o s e   a   p i n n e d   t a b : L  P Q P r   $ / R S R n   $ - T U T 1   + -��
�� 
pidx U n   $ + V W V 4  ( +�� X
�� 
bTab X m   ) *������ W 4  $ (�� Y
�� 
cwin Y m   & '����  S o      ���� 0 new_blank_tab   Q  Z [ Z I  0 D�� \ ]
�� .coremovenull���     obj  \ n   0 ; ^ _ ^ 7  1 ;�� ` a
�� 
bTab ` o   5 7���� 0 current_tab_index   a o   8 :���� 0 last_tab_index   _ o   0 1���� 0 original_window   ] �� b��
�� 
insh b 4  < @�� c
�� 
cwin c m   > ?���� ��   [  d�� d I  E P�� e��
�� .coreclosnull���     obj  e n   E L f g f 4   I L�� h
�� 
bTab h o   J K���� 0 new_blank_tab   g 4  E I�� i
�� 
cwin i m   G H���� ��  ��   - m      j j�                                                                                  sfri  alis    p  Preboot                    ��BD ����
Safari.app                                                     �������        ����  
 cu             Applications  F/:System:Volumes:Preboot:Cryptexes:App:System:Applications:Safari.app/   
 S a f a r i . a p p    P r e b o o t  -/Cryptexes/App/System/Applications/Safari.app   /System/Volumes/Preboot ��  ��  ��  ��       �� k l m��   k ����
�� 
pimr
�� .aevtoappnull  �   � **** l �� n��  n   o p o �� ��
�� 
vers��   p �� q��
�� 
cobj q  r r   ��
�� 
osax��   m �� s���� t u��
�� .aevtoappnull  �   � **** s k     Q v v  *����  ��  ��   t   u  j����������������������������
�� 
cwin�� 0 original_window  
�� 
cTab
�� 
pidx�� 0 current_tab_index  
�� 
bTab�� 0 last_tab_index  
�� 
kocl
�� 
docu
�� .corecrel****      � null�� 0 new_blank_tab  
�� 
insh
�� .coremovenull���     obj 
�� .coreclosnull���     obj �� R� N*�k/E�O��,�,E�O��i/�,E�O*��l 
O*�k/�i/�,E�O�[�\[Z�\Z�2�*�k/l O*�k/��/j U ascr  ��ޭ