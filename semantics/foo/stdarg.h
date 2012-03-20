// #undef va_arg
// #undef va_start
// #undef va_end
// #undef va_copy
// #undef __va_copy
// typedef void* myva_list;
// #define va_list myva_list

typedef void* va_list;

#define __va_argsiz(t)  ((sizeof(t)))
va_list __va_arg(va_list* ap, long long size);
#define va_arg(ap, t) \
    (*((t*)(__va_arg((&(ap)), (__va_argsiz(t))))))

void __va_start(va_list* ap, void* pN);
#define va_start(ap, pN) \
    (__va_start((&(ap)), ((void*)(&(pN)))))

void __va_end(va_list* ap);
#define va_end(ap) \
    (__va_end(&(ap)))

void __va_copy(va_list* dst, va_list src);
#define va_copy(dst, src) \
    (__va_copy((&(dst)), (src)))