FasdUAS 1.101.10   ��   ��    k             i         I      �� 	���� 00 showconfirmationdialog showConfirmationDialog 	  
�� 
 o      ����  0 theprojectname theProjectName��  ��    I    ��  
�� .sysodlogaskr        TEXT  b         b         m        �   n T h i s   w i l l   c r e a t e   a   n e w   p r o j e c t   i n   T h i n g s   b a s e d   o n   t h e     o    ����  0 theprojectname theProjectName  m       �   *    t e m p l a t e   f r o m   B e a r .  ��  
�� 
btns  J    
       m       �    C a n c e l   ��  m       �    C r e a t e   P r o j e c t��    ��   
�� 
dflt  m     ! ! � " "  C r e a t e   P r o j e c t   �� #��
�� 
appr # m     $ $ � % % B T h i n g s   P r o j e c t   f r o m   B e a r   T e m p l a t e��     & ' & l     ��������  ��  ��   '  ( ) ( i     * + * I      �� ,���� 0 	trim_line   ,  - . - o      ���� 0 	this_text   .  / 0 / o      ���� 0 
trim_chars   0  1�� 1 o      ���� 0 trim_indicator  ��  ��   + k     { 2 2  3 4 3 l     �� 5 6��   5 ' ! 0 = beginning, 1 = end, 2 = both    6 � 7 7 B   0   =   b e g i n n i n g ,   1   =   e n d ,   2   =   b o t h 4  8 9 8 r      : ; : l     <���� < n      = > = 1    ��
�� 
leng > l     ?���� ? o     ���� 0 
trim_chars  ��  ��  ��  ��   ; o      ���� 0 x   9  @ A @ l   �� B C��   B   TRIM BEGINNING    C � D D    T R I M   B E G I N N I N G A  E F E Z    > G H���� G E    I J I J    
 K K  L M L m    ����   M  N�� N m    ���� ��   J l  
  O���� O o   
 ���� 0 trim_indicator  ��  ��   H V    : P Q P Q    5 R S T R r    + U V U c    ) W X W l   ' Y���� Y n    ' Z [ Z 7   '�� \ ]
�� 
cha  \ l   # ^���� ^ [    # _ ` _ o     !���� 0 x   ` m   ! "���� ��  ��   ] m   $ &������ [ o    ���� 0 	this_text  ��  ��   X m   ' (��
�� 
TEXT V o      ���� 0 	this_text   S R      ������
�� .ascrerr ****      � ****��  ��   T k   3 5 a a  b c b l  3 3�� d e��   d 8 2 the text contains nothing but the trim characters    e � f f d   t h e   t e x t   c o n t a i n s   n o t h i n g   b u t   t h e   t r i m   c h a r a c t e r s c  g�� g L   3 5 h h m   3 4 i i � j j  ��   Q C    k l k o    ���� 0 	this_text   l l    m���� m o    ���� 0 
trim_chars  ��  ��  ��  ��   F  n o n l  ? ?�� p q��   p   TRIM ENDING    q � r r    T R I M   E N D I N G o  s t s Z   ? x u v���� u E  ? E w x w J   ? C y y  z { z m   ? @����  {  |�� | m   @ A���� ��   x l  C D }���� } o   C D���� 0 trim_indicator  ��  ��   v V   H t ~  ~ Q   P o � � � � r   S e � � � c   S c � � � l  S a ����� � n   S a � � � 7  T a�� � �
�� 
cha  � m   X Z����  � d   [ ` � � l  \ _ ����� � [   \ _ � � � o   \ ]���� 0 x   � m   ] ^���� ��  ��   � o   S T���� 0 	this_text  ��  ��   � m   a b��
�� 
TEXT � o      ���� 0 	this_text   � R      ������
�� .ascrerr ****      � ****��  ��   � k   m o � �  � � � l  m m�� � ���   � 8 2 the text contains nothing but the trim characters    � � � � d   t h e   t e x t   c o n t a i n s   n o t h i n g   b u t   t h e   t r i m   c h a r a c t e r s �  ��� � L   m o � � m   m n � � � � �  ��    D   L O � � � o   L M���� 0 	this_text   � l  M N ����� � o   M N���� 0 
trim_chars  ��  ��  ��  ��   t  ��� � L   y { � � o   y z���� 0 	this_text  ��   )  � � � l     ��������  ��  ��   �  � � � i     � � � I      �� ����� 0 commit_todo   �  � � � o      ���� 0 todoname todoName �  � � � o      ���� 0 	todonotes 	todoNotes �  ��� � o      ���� 0 
theproject 
theProject��  ��   � k     ) � �  � � � Z      � ����� � =     � � � l     ����� � n      � � � 1    ��
�� 
leng � o     ���� 0 todoname todoName��  ��   � m    ����   � L    
����  ��  ��   �  � � � l   ��������  ��  ��   �  ��� � O    ) � � � k    ( � �  � � � l   �� � ���   �   set theTodo to    � � � �    s e t   t h e T o d o   t o �  ��� � l   ( � � � � I   (���� �
�� .corecrel****      � null��   � �� � �
�� 
kocl � l 
   ����� � m    ��
�� 
tstk��  ��   � �� � �
�� 
prdt � l 
  ! ����� � K    ! � � �� � �
�� 
pnam � o    ���� 0 todoname todoName � �� ���
�� 
note � o    ���� 0 	todonotes 	todoNotes��  ��  ��   � �� ���
�� 
insh � n   " $ � � �  ;   # $ � o   " #�� 0 
theproject 
theProject��   �   project theProjectName    � � � � .   p r o j e c t   t h e P r o j e c t N a m e��   � 5    �~ ��}
�~ 
capp � m     � � � � � 4 c o m . c u l t u r e d c o d e . T h i n g s M a c
�} kfrmID  ��   �  � � � l     �|�{�z�|  �{  �z   �  ��y � i     � � � I     �x�w�v
�x .aevtoappnull  �   � ****�w  �v   � k    � � �  � � � r      � � � I    �u�t�s
�u .JonsgClp****    ��� null�t  �s   � o      �r�r &0 previousclipboard previousClipboard �  � � � l   �q�p�o�q  �p  �o   �  � � � O    � � � I   �n�m�l
�n .miscactvnull��� ��� null�m  �l   � m    	 � �p                                                                                      @ alis      curie HD                   �]�BD ����Bear.app                                                       ������s�        ����  
 cu             Applications  /:Applications:Bear.app/    B e a r . a p p    c u r i e   H D  Applications/Bear.app   / ��   �  � � � O    ' � � � O    & � � � I   %�k � �
�k .prcskprsnull���     ctxt � m     � � � � �  c � �j ��i
�j 
faal � m     !�h
�h eMdsKcmd�i   � 4    �g �
�g 
prcs � m     � � � � �  B e a r � m     � ��                                                                                  sevs  alis    T  curie HD                   �]�BD ����System Events.app                                              �����]�        ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    c u r i e   H D  -System/Library/CoreServices/System Events.app   / ��   �  � � � l  ( (�f�e�d�f  �e  �d   �  � � � I  ( -�c ��b
�c .sysodelanull��� ��� nmbr � m   ( ) � � ?ə������b   �  � � � l  . .�a�`�_�a  �`  �_   �  � � � r   . 7   n   . 5 2  3 5�^
�^ 
cpar l  . 3�]�\ I  . 3�[�Z�Y
�[ .JonsgClp****    ��� null�Z  �Y  �]  �\   o      �X�X 0 theparagraphs theParagraphs �  I  8 =�W�V
�W .JonspClpnull���     **** o   8 9�U�U &0 previousclipboard previousClipboard�V   	 l  > >�T�S�R�T  �S  �R  	 

 l  > >�Q�Q   < 6 project name is the first line, minus Markdown header    � l   p r o j e c t   n a m e   i s   t h e   f i r s t   l i n e ,   m i n u s   M a r k d o w n   h e a d e r  r   > Q I   > M�P�O�P 0 	trim_line    n   ? E 4   @ E�N
�N 
cobj m   C D�M�M  o   ? @�L�L 0 theparagraphs theParagraphs  m   E H �  #   �K m   H I�J�J  �K  �O   o      �I�I  0 theprojectname theProjectName  l  R R�H !�H    3 -set theProjectName to item 1 of theParagraphs   ! �"" Z s e t   t h e P r o j e c t N a m e   t o   i t e m   1   o f   t h e P a r a g r a p h s #$# r   R Y%&% n   R W'(' 1   S W�G
�G 
rest( o   R S�F�F 0 theparagraphs theParagraphs& o      �E�E 0 theparagraphs theParagraphs$ )*) l  Z Z�D�C�B�D  �C  �B  * +,+ I   Z b�A-�@�A 00 showconfirmationdialog showConfirmationDialog- .�?. o   [ ^�>�>  0 theprojectname theProjectName�?  �@  , /0/ l  c c�=�<�;�=  �<  �;  0 121 O   c �343 k   q �55 676 I  q v�:�9�8
�: .miscactvnull��� ��� null�9  �8  7 898 r   w �:;: I  w ��7�6<
�7 .corecrel****      � null�6  < �5=>
�5 
kocl= m   { ~�4
�4 
tspt> �3?�2
�3 
prdt? K   � �@@ �1A�0
�1 
pnamA o   � ��/�/  0 theprojectname theProjectName�0  �2  ; o      �.�. 0 
theproject 
theProject9 B�-B I  � ��,C�+
�, .THGSshownull���     ****C o   � ��*�* 0 
theproject 
theProject�+  �-  4 5   c n�)D�(
�) 
cappD m   g jEE �FF 4 c o m . c u l t u r e d c o d e . T h i n g s M a c
�( kfrmID  2 GHG l  � ��'�&�%�'  �&  �%  H IJI l  � ��$KL�$  K 9 3 buffer todo name and notes as we read line-by-line   L �MM f   b u f f e r   t o d o   n a m e   a n d   n o t e s   a s   w e   r e a d   l i n e - b y - l i n eJ NON r   � �PQP m   � �RR �SS  Q o      �#�# 0 todoname todoNameO TUT r   � �VWV m   � �XX �YY  W o      �"�" 0 	todonotes 	todoNotesU Z[Z l  � ��!� ��!  �   �  [ \]\ X   ��^�_^ Z   ��`a��` ?  � �bcb n   � �ded 1   � ��
� 
lenge o   � ��� 0 nextline nextLinec m   � ���  a k   ��ff ghg l  � ��ij�  i A ; we're done if we hit a HR, which I use as a footer in Bear   j �kk v   w e ' r e   d o n e   i f   w e   h i t   a   H R ,   w h i c h   I   u s e   a s   a   f o o t e r   i n   B e a rh lml Z   � �no��n G   � �pqp C  � �rsr o   � ��� 0 nextline nextLines m   � �tt �uu  - -q C  � �vwv o   � ��� 0 nextline nextLinew m   � �xx �yy  -   -o  S   � ��  �  m z{z l  � �����  �  �  { |}| r   � �~~ n   � ���� 2  � ��
� 
cha � o   � ��� 0 nextline nextLine o      �� 0 thechars theChars} ��� Z   ������� G   ���� =  � ���� n   � ���� 4   � ���
� 
cobj� m   � ��
�
 � o   � ��	�	 0 thechars theChars� m   � ��� ���  *� =  �
��� n   ���� 4  ��
� 
cobj� m  �� � o   ��� 0 thechars theChars� m  	�� ���  -� k  ?�� ��� l ����  � ] W if we hit a new todo, try to commit what we've buffered so far, then reset our buffers   � ��� �   i f   w e   h i t   a   n e w   t o d o ,   t r y   t o   c o m m i t   w h a t   w e ' v e   b u f f e r e d   s o   f a r ,   t h e n   r e s e t   o u r   b u f f e r s� ��� I  ���� 0 commit_todo  � ��� o  �� 0 todoname todoName� ��� o  �� 0 	todonotes 	todoNotes� �� � o  ���� 0 
theproject 
theProject�   �  � ��� l   ��������  ��  ��  � ��� r   7��� I   3������� 0 	trim_line  � ��� o  !"���� 0 nextline nextLine� ��� b  ".��� n  "*��� 4  %*���
�� 
cobj� m  ()���� � o  "%���� 0 thechars theChars� m  *-�� ���   � ���� m  ./����  ��  ��  � o      ���� 0 todoname todoName� ���� r  8?��� m  8;�� ���  � o      ���� 0 	todonotes 	todoNotes��  �  � k  B��� ��� l BB������  � > 8 not a new todo, so buffer as notes for the current todo   � ��� p   n o t   a   n e w   t o d o ,   s o   b u f f e r   a s   n o t e s   f o r   t h e   c u r r e n t   t o d o� ��� Z  B]������� > BK��� n  BI��� 1  EI��
�� 
leng� o  BE���� 0 	todonotes 	todoNotes� m  IJ����  � r  NY��� b  NU��� o  NQ���� 0 	todonotes 	todoNotes� m  QT�� ���  
� o      ���� 0 	todonotes 	todoNotes��  ��  � ��� Z  ^v������� = ^j��� n  ^f��� 4  af���
�� 
cobj� m  de���� � o  ^a���� 0 thechars theChars� m  fi�� ���  ;� r  mr��� m  mp�� ���  � o      ���� 0 nextline nextLine��  ��  � ���� r  w���� b  w|��� o  wz���� 0 	todonotes 	todoNotes� o  z{���� 0 nextline nextLine� o      ���� 0 	todonotes 	todoNotes��  �  �  �  � 0 nextline nextLine_ o   � ����� 0 theparagraphs theParagraphs] ��� l ����������  ��  ��  � ��� l ��������  � $  commit the last-buffered todo   � ��� <   c o m m i t   t h e   l a s t - b u f f e r e d   t o d o� ���� I  ��������� 0 commit_todo  � ��� o  ������ 0 todoname todoName� ��� o  ������ 0 	todonotes 	todoNotes� ���� o  ������ 0 
theproject 
theProject��  ��  ��  �y       ���������  � ���������� 00 showconfirmationdialog showConfirmationDialog�� 0 	trim_line  �� 0 commit_todo  
�� .aevtoappnull  �   � ****� �� ���������� 00 showconfirmationdialog showConfirmationDialog�� ����� �  ����  0 theprojectname theProjectName��  � ����  0 theprojectname theProjectName�   ��  �� !�� $����
�� 
btns
�� 
dflt
�� 
appr�� 
�� .sysodlogaskr        TEXT�� �%�%���lv����� 
� �� +���������� 0 	trim_line  �� ����� �  �������� 0 	this_text  �� 0 
trim_chars  �� 0 trim_indicator  ��  � ���������� 0 	this_text  �� 0 
trim_chars  �� 0 trim_indicator  �� 0 x  � ���������� i �
�� 
leng
�� 
cha 
�� 
TEXT��  ��  �� |��,E�Ojllv� 0 *h�� �[�\[Z�k\Zi2�&E�W 	X  �[OY��Y hOkllv� 1 +h�� �[�\[Zk\Z�k'2�&E�W 	X  �[OY��Y hO�� �� ����������� 0 commit_todo  �� ����� �  �������� 0 todoname todoName�� 0 	todonotes 	todoNotes�� 0 
theproject 
theProject��  � �������� 0 todoname todoName�� 0 	todonotes 	todoNotes�� 0 
theproject 
theProject� ���� ���������������������
�� 
leng
�� 
capp
�� kfrmID  
�� 
kocl
�� 
tstk
�� 
prdt
�� 
pnam
�� 
note�� 
�� 
insh�� 
�� .corecrel****      � null�� *��,j  hY hO)���0 *�������6� U� �� ����� ��
�� .aevtoappnull  �   � ****��  ��    ���� 0 nextline nextLine 4���� ��� ��� � ������� ���������������������E����������~�}�|�{R�zX�y�x�wtx�v�u�t���s�����
�� .JonsgClp****    ��� null�� &0 previousclipboard previousClipboard
�� .miscactvnull��� ��� null
�� 
prcs
�� 
faal
�� eMdsKcmd
�� .prcskprsnull���     ctxt
�� .sysodelanull��� ��� nmbr
�� 
cpar�� 0 theparagraphs theParagraphs
�� .JonspClpnull���     ****
�� 
cobj�� 0 	trim_line  ��  0 theprojectname theProjectName
�� 
rest�� 00 showconfirmationdialog showConfirmationDialog
�� 
capp
�� kfrmID  
�� 
kocl
�� 
tspt
�� 
prdt
� 
pnam�~ 
�} .corecrel****      � null�| 0 
theproject 
theProject
�{ .THGSshownull���     ****�z 0 todoname todoName�y 0 	todonotes 	todoNotes
�x .corecnte****       ****
�w 
leng
�v 
bool
�u 
cha �t 0 thechars theChars�s 0 commit_todo  ���*j  E�O� *j UO� *��/ 	���l 
UUO�j O*j  �-E�O�j O*�a k/a jm+ E` O�a ,E�O*_ k+ O)a a a 0 ,*j O*a a a a _ la  E` O_ j  UOa !E` "Oa #E` $O ��[a a l %kh  �a &,j ��a '
 �a (a )& Y hO�a *-E` +O_ +a k/a , 
 _ +a k/a - a )& 3*_ "_ $_ m+ .O*�_ +a k/a /%jm+ E` "Oa 0E` $Y @_ $a &,j _ $a 1%E` $Y hO_ +a k/a 2  
a 3E�Y hO_ $�%E` $Y h[OY�7O*_ "_ $_ m+ . ascr  ��ޭ