package main

func (s *kvStore) readEntry(key string, isSuccess chan readResult) {
	v, ok := s.data.Load(key)
	res := readResult{value: v, ok: ok}
	isSuccess <-res
}

func (s *kvStore) writeEntry(key string, value string) {
	s.data.Store(key, value)
}