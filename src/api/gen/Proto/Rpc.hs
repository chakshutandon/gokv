{- This file was auto-generated from rpc.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies,
  UndecidableInstances, GeneralizedNewtypeDeriving,
  MultiParamTypeClasses, FlexibleContexts, FlexibleInstances,
  PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds,
  BangPatterns, TypeApplications #-}
{-# OPTIONS_GHC -fno-warn-unused-imports#-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports#-}
module Proto.Rpc
       (GoKV(..), ReadKVRequest(), ReadKVResponse(), WriteKVRequest(),
        WriteKVResponse())
       where
import qualified Data.ProtoLens.Runtime.Control.DeepSeq
       as Control.DeepSeq
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Prism
       as Data.ProtoLens.Prism
import qualified Data.ProtoLens.Runtime.Prelude as Prelude
import qualified Data.ProtoLens.Runtime.Data.Int as Data.Int
import qualified Data.ProtoLens.Runtime.Data.Monoid as Data.Monoid
import qualified Data.ProtoLens.Runtime.Data.Word as Data.Word
import qualified Data.ProtoLens.Runtime.Data.ProtoLens
       as Data.ProtoLens
import qualified
       Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Bytes
       as Data.ProtoLens.Encoding.Bytes
import qualified
       Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Growing
       as Data.ProtoLens.Encoding.Growing
import qualified
       Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Parser.Unsafe
       as Data.ProtoLens.Encoding.Parser.Unsafe
import qualified
       Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Wire
       as Data.ProtoLens.Encoding.Wire
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Field
       as Data.ProtoLens.Field
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Message.Enum
       as Data.ProtoLens.Message.Enum
import qualified
       Data.ProtoLens.Runtime.Data.ProtoLens.Service.Types
       as Data.ProtoLens.Service.Types
import qualified Data.ProtoLens.Runtime.Lens.Family2
       as Lens.Family2
import qualified Data.ProtoLens.Runtime.Lens.Family2.Unchecked
       as Lens.Family2.Unchecked
import qualified Data.ProtoLens.Runtime.Data.Text as Data.Text
import qualified Data.ProtoLens.Runtime.Data.Map as Data.Map
import qualified Data.ProtoLens.Runtime.Data.ByteString
       as Data.ByteString
import qualified Data.ProtoLens.Runtime.Data.ByteString.Char8
       as Data.ByteString.Char8
import qualified Data.ProtoLens.Runtime.Data.Text.Encoding
       as Data.Text.Encoding
import qualified Data.ProtoLens.Runtime.Data.Vector as Data.Vector
import qualified Data.ProtoLens.Runtime.Data.Vector.Generic
       as Data.Vector.Generic
import qualified Data.ProtoLens.Runtime.Data.Vector.Unboxed
       as Data.Vector.Unboxed
import qualified Data.ProtoLens.Runtime.Text.Read as Text.Read

{- | Fields :

    * 'Proto.Rpc_Fields.key' @:: Lens' ReadKVRequest Data.Text.Text@
 -}
data ReadKVRequest = ReadKVRequest{_ReadKVRequest'key ::
                                   !Data.Text.Text,
                                   _ReadKVRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
                       deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ReadKVRequest where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ReadKVRequest "key"
           (Data.Text.Text)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _ReadKVRequest'key
               (\ x__ y__ -> x__{_ReadKVRequest'key = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Message ReadKVRequest where
        messageName _ = Data.Text.pack "main.ReadKVRequest"
        fieldsByTag
          = let key__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "key"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"key"))
                      :: Data.ProtoLens.FieldDescriptor ReadKVRequest
              in
              Data.Map.fromList [(Data.ProtoLens.Tag 1, key__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _ReadKVRequest'_unknownFields
              (\ x__ y__ -> x__{_ReadKVRequest'_unknownFields = y__})
        defMessage
          = ReadKVRequest{_ReadKVRequest'key = Data.ProtoLens.fieldDefault,
                          _ReadKVRequest'_unknownFields = ([])}
        parseMessage
          = let loop ::
                     ReadKVRequest -> Data.ProtoLens.Encoding.Bytes.Parser ReadKVRequest
                loop x
                  = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
                       if end then
                         do let missing = [] in
                              if Prelude.null missing then Prelude.return () else
                                Prelude.fail
                                  (("Missing required fields: ") Prelude.++
                                     Prelude.show (missing :: ([Prelude.String])))
                            Prelude.return
                              (Lens.Family2.over Data.ProtoLens.unknownFields
                                 (\ !t -> Prelude.reverse t)
                                 x)
                         else
                         do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                            case tag of
                                10 -> do y <- (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                              Data.ProtoLens.Encoding.Bytes.getBytes
                                                                (Prelude.fromIntegral len)
                                                  Data.ProtoLens.Encoding.Bytes.runEither
                                                    (case Data.Text.Encoding.decodeUtf8' value of
                                                         Prelude.Left err -> Prelude.Left
                                                                               (Prelude.show err)
                                                         Prelude.Right r -> Prelude.Right r))
                                                Data.ProtoLens.Encoding.Bytes.<?> "key"
                                         loop
                                           (Lens.Family2.set (Data.ProtoLens.Field.field @"key") y
                                              x)
                                wire -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                                   wire
                                           loop
                                             (Lens.Family2.over Data.ProtoLens.unknownFields
                                                (\ !t -> (:) y t)
                                                x)
              in
              (do loop Data.ProtoLens.defMessage)
                Data.ProtoLens.Encoding.Bytes.<?> "ReadKVRequest"
        buildMessage
          = (\ _x ->
               (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"key") _x
                  in
                  if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty else
                    (Data.ProtoLens.Encoding.Bytes.putVarInt 10) Data.Monoid.<>
                      (((\ bs ->
                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                              (Prelude.fromIntegral (Data.ByteString.length bs)))
                             Data.Monoid.<> Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Prelude.. Data.Text.Encoding.encodeUtf8)
                        _v)
                 Data.Monoid.<>
                 Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData ReadKVRequest where
        rnf
          = (\ x__ ->
               Control.DeepSeq.deepseq (_ReadKVRequest'_unknownFields x__)
                 (Control.DeepSeq.deepseq (_ReadKVRequest'key x__) (())))
{- | Fields :

    * 'Proto.Rpc_Fields.success' @:: Lens' ReadKVResponse Prelude.Bool@
    * 'Proto.Rpc_Fields.key' @:: Lens' ReadKVResponse Data.Text.Text@
    * 'Proto.Rpc_Fields.value' @:: Lens' ReadKVResponse Data.Text.Text@
 -}
data ReadKVResponse = ReadKVResponse{_ReadKVResponse'success ::
                                     !Prelude.Bool,
                                     _ReadKVResponse'key :: !Data.Text.Text,
                                     _ReadKVResponse'value :: !Data.Text.Text,
                                     _ReadKVResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
                        deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ReadKVResponse where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ReadKVResponse "success"
           (Prelude.Bool)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _ReadKVResponse'success
               (\ x__ y__ -> x__{_ReadKVResponse'success = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Field.HasField ReadKVResponse "key"
           (Data.Text.Text)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _ReadKVResponse'key
               (\ x__ y__ -> x__{_ReadKVResponse'key = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Field.HasField ReadKVResponse "value"
           (Data.Text.Text)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _ReadKVResponse'value
               (\ x__ y__ -> x__{_ReadKVResponse'value = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Message ReadKVResponse where
        messageName _ = Data.Text.pack "main.ReadKVResponse"
        fieldsByTag
          = let success__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "success"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"success"))
                      :: Data.ProtoLens.FieldDescriptor ReadKVResponse
                key__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "key"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"key"))
                      :: Data.ProtoLens.FieldDescriptor ReadKVResponse
                value__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"value"))
                      :: Data.ProtoLens.FieldDescriptor ReadKVResponse
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, success__field_descriptor),
                 (Data.ProtoLens.Tag 2, key__field_descriptor),
                 (Data.ProtoLens.Tag 3, value__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _ReadKVResponse'_unknownFields
              (\ x__ y__ -> x__{_ReadKVResponse'_unknownFields = y__})
        defMessage
          = ReadKVResponse{_ReadKVResponse'success =
                             Data.ProtoLens.fieldDefault,
                           _ReadKVResponse'key = Data.ProtoLens.fieldDefault,
                           _ReadKVResponse'value = Data.ProtoLens.fieldDefault,
                           _ReadKVResponse'_unknownFields = ([])}
        parseMessage
          = let loop ::
                     ReadKVResponse ->
                       Data.ProtoLens.Encoding.Bytes.Parser ReadKVResponse
                loop x
                  = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
                       if end then
                         do let missing = [] in
                              if Prelude.null missing then Prelude.return () else
                                Prelude.fail
                                  (("Missing required fields: ") Prelude.++
                                     Prelude.show (missing :: ([Prelude.String])))
                            Prelude.return
                              (Lens.Family2.over Data.ProtoLens.unknownFields
                                 (\ !t -> Prelude.reverse t)
                                 x)
                         else
                         do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                            case tag of
                                8 -> do y <- (Prelude.fmap ((Prelude./=) 0)
                                                Data.ProtoLens.Encoding.Bytes.getVarInt)
                                               Data.ProtoLens.Encoding.Bytes.<?> "success"
                                        loop
                                          (Lens.Family2.set (Data.ProtoLens.Field.field @"success")
                                             y
                                             x)
                                18 -> do y <- (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                              Data.ProtoLens.Encoding.Bytes.getBytes
                                                                (Prelude.fromIntegral len)
                                                  Data.ProtoLens.Encoding.Bytes.runEither
                                                    (case Data.Text.Encoding.decodeUtf8' value of
                                                         Prelude.Left err -> Prelude.Left
                                                                               (Prelude.show err)
                                                         Prelude.Right r -> Prelude.Right r))
                                                Data.ProtoLens.Encoding.Bytes.<?> "key"
                                         loop
                                           (Lens.Family2.set (Data.ProtoLens.Field.field @"key") y
                                              x)
                                26 -> do y <- (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                              Data.ProtoLens.Encoding.Bytes.getBytes
                                                                (Prelude.fromIntegral len)
                                                  Data.ProtoLens.Encoding.Bytes.runEither
                                                    (case Data.Text.Encoding.decodeUtf8' value of
                                                         Prelude.Left err -> Prelude.Left
                                                                               (Prelude.show err)
                                                         Prelude.Right r -> Prelude.Right r))
                                                Data.ProtoLens.Encoding.Bytes.<?> "value"
                                         loop
                                           (Lens.Family2.set (Data.ProtoLens.Field.field @"value") y
                                              x)
                                wire -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                                   wire
                                           loop
                                             (Lens.Family2.over Data.ProtoLens.unknownFields
                                                (\ !t -> (:) y t)
                                                x)
              in
              (do loop Data.ProtoLens.defMessage)
                Data.ProtoLens.Encoding.Bytes.<?> "ReadKVResponse"
        buildMessage
          = (\ _x ->
               (let _v
                      = Lens.Family2.view (Data.ProtoLens.Field.field @"success") _x
                  in
                  if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty else
                    (Data.ProtoLens.Encoding.Bytes.putVarInt 8) Data.Monoid.<>
                      ((Data.ProtoLens.Encoding.Bytes.putVarInt) Prelude..
                         (\ b -> if b then 1 else 0))
                        _v)
                 Data.Monoid.<>
                 (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"key") _x
                    in
                    if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                      Data.Monoid.mempty else
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 18) Data.Monoid.<>
                        (((\ bs ->
                             (Data.ProtoLens.Encoding.Bytes.putVarInt
                                (Prelude.fromIntegral (Data.ByteString.length bs)))
                               Data.Monoid.<> Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Prelude.. Data.Text.Encoding.encodeUtf8)
                          _v)
                   Data.Monoid.<>
                   (let _v
                          = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
                      in
                      if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                        Data.Monoid.mempty else
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 26) Data.Monoid.<>
                          (((\ bs ->
                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 Data.Monoid.<> Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Prelude.. Data.Text.Encoding.encodeUtf8)
                            _v)
                     Data.Monoid.<>
                     Data.ProtoLens.Encoding.Wire.buildFieldSet
                       (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData ReadKVResponse where
        rnf
          = (\ x__ ->
               Control.DeepSeq.deepseq (_ReadKVResponse'_unknownFields x__)
                 (Control.DeepSeq.deepseq (_ReadKVResponse'success x__)
                    (Control.DeepSeq.deepseq (_ReadKVResponse'key x__)
                       (Control.DeepSeq.deepseq (_ReadKVResponse'value x__) (())))))
{- | Fields :

    * 'Proto.Rpc_Fields.key' @:: Lens' WriteKVRequest Data.Text.Text@
    * 'Proto.Rpc_Fields.value' @:: Lens' WriteKVRequest Data.Text.Text@
 -}
data WriteKVRequest = WriteKVRequest{_WriteKVRequest'key ::
                                     !Data.Text.Text,
                                     _WriteKVRequest'value :: !Data.Text.Text,
                                     _WriteKVRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
                        deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show WriteKVRequest where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField WriteKVRequest "key"
           (Data.Text.Text)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _WriteKVRequest'key
               (\ x__ y__ -> x__{_WriteKVRequest'key = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Field.HasField WriteKVRequest "value"
           (Data.Text.Text)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _WriteKVRequest'value
               (\ x__ y__ -> x__{_WriteKVRequest'value = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Message WriteKVRequest where
        messageName _ = Data.Text.pack "main.WriteKVRequest"
        fieldsByTag
          = let key__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "key"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"key"))
                      :: Data.ProtoLens.FieldDescriptor WriteKVRequest
                value__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"value"))
                      :: Data.ProtoLens.FieldDescriptor WriteKVRequest
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, key__field_descriptor),
                 (Data.ProtoLens.Tag 2, value__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _WriteKVRequest'_unknownFields
              (\ x__ y__ -> x__{_WriteKVRequest'_unknownFields = y__})
        defMessage
          = WriteKVRequest{_WriteKVRequest'key = Data.ProtoLens.fieldDefault,
                           _WriteKVRequest'value = Data.ProtoLens.fieldDefault,
                           _WriteKVRequest'_unknownFields = ([])}
        parseMessage
          = let loop ::
                     WriteKVRequest ->
                       Data.ProtoLens.Encoding.Bytes.Parser WriteKVRequest
                loop x
                  = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
                       if end then
                         do let missing = [] in
                              if Prelude.null missing then Prelude.return () else
                                Prelude.fail
                                  (("Missing required fields: ") Prelude.++
                                     Prelude.show (missing :: ([Prelude.String])))
                            Prelude.return
                              (Lens.Family2.over Data.ProtoLens.unknownFields
                                 (\ !t -> Prelude.reverse t)
                                 x)
                         else
                         do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                            case tag of
                                10 -> do y <- (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                              Data.ProtoLens.Encoding.Bytes.getBytes
                                                                (Prelude.fromIntegral len)
                                                  Data.ProtoLens.Encoding.Bytes.runEither
                                                    (case Data.Text.Encoding.decodeUtf8' value of
                                                         Prelude.Left err -> Prelude.Left
                                                                               (Prelude.show err)
                                                         Prelude.Right r -> Prelude.Right r))
                                                Data.ProtoLens.Encoding.Bytes.<?> "key"
                                         loop
                                           (Lens.Family2.set (Data.ProtoLens.Field.field @"key") y
                                              x)
                                18 -> do y <- (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                              Data.ProtoLens.Encoding.Bytes.getBytes
                                                                (Prelude.fromIntegral len)
                                                  Data.ProtoLens.Encoding.Bytes.runEither
                                                    (case Data.Text.Encoding.decodeUtf8' value of
                                                         Prelude.Left err -> Prelude.Left
                                                                               (Prelude.show err)
                                                         Prelude.Right r -> Prelude.Right r))
                                                Data.ProtoLens.Encoding.Bytes.<?> "value"
                                         loop
                                           (Lens.Family2.set (Data.ProtoLens.Field.field @"value") y
                                              x)
                                wire -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                                   wire
                                           loop
                                             (Lens.Family2.over Data.ProtoLens.unknownFields
                                                (\ !t -> (:) y t)
                                                x)
              in
              (do loop Data.ProtoLens.defMessage)
                Data.ProtoLens.Encoding.Bytes.<?> "WriteKVRequest"
        buildMessage
          = (\ _x ->
               (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"key") _x
                  in
                  if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty else
                    (Data.ProtoLens.Encoding.Bytes.putVarInt 10) Data.Monoid.<>
                      (((\ bs ->
                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                              (Prelude.fromIntegral (Data.ByteString.length bs)))
                             Data.Monoid.<> Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Prelude.. Data.Text.Encoding.encodeUtf8)
                        _v)
                 Data.Monoid.<>
                 (let _v
                        = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
                    in
                    if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                      Data.Monoid.mempty else
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 18) Data.Monoid.<>
                        (((\ bs ->
                             (Data.ProtoLens.Encoding.Bytes.putVarInt
                                (Prelude.fromIntegral (Data.ByteString.length bs)))
                               Data.Monoid.<> Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Prelude.. Data.Text.Encoding.encodeUtf8)
                          _v)
                   Data.Monoid.<>
                   Data.ProtoLens.Encoding.Wire.buildFieldSet
                     (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData WriteKVRequest where
        rnf
          = (\ x__ ->
               Control.DeepSeq.deepseq (_WriteKVRequest'_unknownFields x__)
                 (Control.DeepSeq.deepseq (_WriteKVRequest'key x__)
                    (Control.DeepSeq.deepseq (_WriteKVRequest'value x__) (()))))
{- | Fields :

    * 'Proto.Rpc_Fields.success' @:: Lens' WriteKVResponse Prelude.Bool@
    * 'Proto.Rpc_Fields.key' @:: Lens' WriteKVResponse Data.Text.Text@
 -}
data WriteKVResponse = WriteKVResponse{_WriteKVResponse'success ::
                                       !Prelude.Bool,
                                       _WriteKVResponse'key :: !Data.Text.Text,
                                       _WriteKVResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
                         deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show WriteKVResponse where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField WriteKVResponse "success"
           (Prelude.Bool)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _WriteKVResponse'success
               (\ x__ y__ -> x__{_WriteKVResponse'success = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Field.HasField WriteKVResponse "key"
           (Data.Text.Text)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _WriteKVResponse'key
               (\ x__ y__ -> x__{_WriteKVResponse'key = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Message WriteKVResponse where
        messageName _ = Data.Text.pack "main.WriteKVResponse"
        fieldsByTag
          = let success__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "success"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"success"))
                      :: Data.ProtoLens.FieldDescriptor WriteKVResponse
                key__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "key"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"key"))
                      :: Data.ProtoLens.FieldDescriptor WriteKVResponse
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, success__field_descriptor),
                 (Data.ProtoLens.Tag 2, key__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _WriteKVResponse'_unknownFields
              (\ x__ y__ -> x__{_WriteKVResponse'_unknownFields = y__})
        defMessage
          = WriteKVResponse{_WriteKVResponse'success =
                              Data.ProtoLens.fieldDefault,
                            _WriteKVResponse'key = Data.ProtoLens.fieldDefault,
                            _WriteKVResponse'_unknownFields = ([])}
        parseMessage
          = let loop ::
                     WriteKVResponse ->
                       Data.ProtoLens.Encoding.Bytes.Parser WriteKVResponse
                loop x
                  = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
                       if end then
                         do let missing = [] in
                              if Prelude.null missing then Prelude.return () else
                                Prelude.fail
                                  (("Missing required fields: ") Prelude.++
                                     Prelude.show (missing :: ([Prelude.String])))
                            Prelude.return
                              (Lens.Family2.over Data.ProtoLens.unknownFields
                                 (\ !t -> Prelude.reverse t)
                                 x)
                         else
                         do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                            case tag of
                                8 -> do y <- (Prelude.fmap ((Prelude./=) 0)
                                                Data.ProtoLens.Encoding.Bytes.getVarInt)
                                               Data.ProtoLens.Encoding.Bytes.<?> "success"
                                        loop
                                          (Lens.Family2.set (Data.ProtoLens.Field.field @"success")
                                             y
                                             x)
                                18 -> do y <- (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                              Data.ProtoLens.Encoding.Bytes.getBytes
                                                                (Prelude.fromIntegral len)
                                                  Data.ProtoLens.Encoding.Bytes.runEither
                                                    (case Data.Text.Encoding.decodeUtf8' value of
                                                         Prelude.Left err -> Prelude.Left
                                                                               (Prelude.show err)
                                                         Prelude.Right r -> Prelude.Right r))
                                                Data.ProtoLens.Encoding.Bytes.<?> "key"
                                         loop
                                           (Lens.Family2.set (Data.ProtoLens.Field.field @"key") y
                                              x)
                                wire -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                                   wire
                                           loop
                                             (Lens.Family2.over Data.ProtoLens.unknownFields
                                                (\ !t -> (:) y t)
                                                x)
              in
              (do loop Data.ProtoLens.defMessage)
                Data.ProtoLens.Encoding.Bytes.<?> "WriteKVResponse"
        buildMessage
          = (\ _x ->
               (let _v
                      = Lens.Family2.view (Data.ProtoLens.Field.field @"success") _x
                  in
                  if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty else
                    (Data.ProtoLens.Encoding.Bytes.putVarInt 8) Data.Monoid.<>
                      ((Data.ProtoLens.Encoding.Bytes.putVarInt) Prelude..
                         (\ b -> if b then 1 else 0))
                        _v)
                 Data.Monoid.<>
                 (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"key") _x
                    in
                    if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                      Data.Monoid.mempty else
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 18) Data.Monoid.<>
                        (((\ bs ->
                             (Data.ProtoLens.Encoding.Bytes.putVarInt
                                (Prelude.fromIntegral (Data.ByteString.length bs)))
                               Data.Monoid.<> Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Prelude.. Data.Text.Encoding.encodeUtf8)
                          _v)
                   Data.Monoid.<>
                   Data.ProtoLens.Encoding.Wire.buildFieldSet
                     (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData WriteKVResponse where
        rnf
          = (\ x__ ->
               Control.DeepSeq.deepseq (_WriteKVResponse'_unknownFields x__)
                 (Control.DeepSeq.deepseq (_WriteKVResponse'success x__)
                    (Control.DeepSeq.deepseq (_WriteKVResponse'key x__) (()))))
data GoKV = GoKV{}
              deriving ()
instance Data.ProtoLens.Service.Types.Service GoKV where
        type ServiceName GoKV = "GoKV"
        type ServicePackage GoKV = "main"
        type ServiceMethods GoKV = '["readKVRPC", "writeKVRPC"]
instance Data.ProtoLens.Service.Types.HasMethodImpl GoKV
           "readKVRPC"
         where
        type MethodName GoKV "readKVRPC" = "ReadKVRPC"
        type MethodInput GoKV "readKVRPC" = ReadKVRequest
        type MethodOutput GoKV "readKVRPC" = ReadKVResponse
        type MethodStreamingType GoKV "readKVRPC" =
             'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl GoKV
           "writeKVRPC"
         where
        type MethodName GoKV "writeKVRPC" = "WriteKVRPC"
        type MethodInput GoKV "writeKVRPC" = WriteKVRequest
        type MethodOutput GoKV "writeKVRPC" = WriteKVResponse
        type MethodStreamingType GoKV "writeKVRPC" =
             'Data.ProtoLens.Service.Types.NonStreaming