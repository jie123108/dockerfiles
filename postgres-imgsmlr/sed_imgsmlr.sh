sed -i 's/define IMGSMLR_H/define IMGSMLR_H\
\
#ifndef FALSE  \
#define FALSE   (0)  \
#endif  \
\
#ifndef TRUE  \
#define TRUE (!FALSE)  \
#endif\
/g' imgsmlr.h && cat imgsmlr.h
