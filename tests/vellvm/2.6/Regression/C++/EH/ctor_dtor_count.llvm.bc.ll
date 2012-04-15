; ModuleID = 'ctor_dtor_count.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.A = type <{ i8 }>
%struct.B = type { %struct.A }
%struct.__fundamental_type_info_pseudo = type { %struct.__type_info_pseudo }
%struct.__type_info_pseudo = type { i8*, i8* }

@_ZTIi = external constant %struct.__fundamental_type_info_pseudo ; <%struct.__fundamental_type_info_pseudo*> [#uses=1]
@.str = private constant [8 x i8] c"All ok!\00", align 1 ; <[8 x i8]*> [#uses=1]

define i32 @main() {
entry:
  %0 = call i8* @__cxa_allocate_exception(i32 4) nounwind ; <i8*> [#uses=2]
  %1 = bitcast i8* %0 to i32*                     ; <i32*> [#uses=1]
  store i32 1, i32* %1, align 4
  invoke void @__cxa_throw(i8* %0, i8* bitcast (%struct.__fundamental_type_info_pseudo* @_ZTIi to i8*), void (i8*)* null) noreturn
          to label %invcont.i unwind label %lpad.i

invcont.i:                                        ; preds = %entry
  unreachable

lpad.i:                                           ; preds = %entry
  %eh_ptr.i = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select5.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i)
          to label %.noexc1 unwind label %bb2

.noexc1:                                          ; preds = %lpad.i
  unreachable

bb2:                                              ; preds = %lpad.i
  %eh_ptr = call i8* @llvm.eh.exception()         ; <i8*> [#uses=2]
  %eh_select = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %2 = call i8* @__cxa_begin_catch(i8* %eh_ptr) nounwind ; <i8*> [#uses=0]
  call void @__cxa_end_catch()
  %3 = call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0)) ; <i32> [#uses=0]
  ret i32 0
}

declare i8* @__cxa_allocate_exception(i32) nounwind

declare void @__cxa_throw(i8*, i8*, void (i8*)*) noreturn

declare i8* @llvm.eh.exception() nounwind

declare i32 @llvm.eh.selector.i32(i8*, i8*, ...) nounwind

declare i32 @__gxx_personality_v0(...)

declare void @_Unwind_Resume_or_Rethrow(i8*)

declare i8* @__cxa_begin_catch(i8*) nounwind

declare void @__cxa_end_catch()

declare i32 @puts(i8* nocapture) nounwind
