[ENG]
Programmable Logic Controllers (PLCs) are the main industrial platform used for 
implementing direct control algorithms. PLCs are highly reliable, fulfill the 
demand for real-time operation, their modular construction allows for 
flexibility when connecting to the control system and shaping the system's end 
functionality. PLCs also provide a wide range of communication possibilities: 
Profinet, Profibus, Ethernet, CAN, Modbus TCP/Serial, etc. 

PLCs are generally only equipped with basic control algorithms. However, the 
processing power of modern PLCs, amount of memory available to the user and the 
ability to use high-level programming languages make it possible, while taking 
into account the way these devices work, to create code which implements useful 
algorithms. Due to the specific nature of the way a PLC operates (program scan 
cycles), the kinds of algorithms especially predestined for implementation in 
PLCs are ones expressed as difference equations. This opens up a wide variety 
of possibilities for implementing advanced algorithms known from the theory of 
filtration, estimation, control and optimization.

The goal of the group research project is verifying the hypothesis regarding 
the possibility of using PLCs as a platform for implementing advanced control 
algorithms by developing:
1. A set of benchmarks for PLCs known from PCs. Based on the results of these 
tests one can assess the possiblity of implementation (or the range of 
applicability) of particular algorithms
2. Creating effective algorithms sharing code between PLC cycles
3. Creating a library of advanced algorithms of:
  * Filtration
  * Estimation
  * Control
  * Optimization (optionally)
5. Applying and veryfying the created library using simulators and real objects 
in the form of lab stations
6. Publishing the created software in the form of a GitHub repository
7. Compiling a paper documenting the research and effects obtained as a result 
of the project.

---

[PL]
Sterowniki programowalne (PLC) są główną przemysłową platformą implementacji 
algorytmów sterowania bezpośredniego. PLC cechują się wysokim poziomem 
niezawodności, spełniają postulat czasu rzeczywistego, ich modularna budowa 
zapewnia elastyczność włączenia w układ sterowania i kształtowania ostatecznej 
funkcjonalności systemu. PLC zapewniają również duże możliwości komunikacyjne: 
Profinet, Profibus, Ethernet, CAN, Modbus TCP/Serial, etc.

Standardowo PLC wyposażone są wyłącznie w podstawowe algorytmy sterowania. 
Jednak moc obliczeniowa współczesnych PLC, rozmiar dostępnej dla użytkownika 
pamięci oraz możliwość stosowania wysokopoziomowych języków programowania 
sprawiają, że przy uwzględnieniu sposobu pracy tych urządzeń możliwe jest 
opracowanie kodu realizującego wiele użytecznych algorytmów. Ze względu na 
specyfikę działania PLC w postaci cykli szczególnie predystynowane do 
implementacji w PLC są algorytmy dane przez równania różnicowe. Otwiera to 
szerokie możliwości implementacji zaawansowanych algorytmów znanych z teorii 
filtracji, estymacji, sterowania i optymalizacji.

Celem zespołowego projektu badawczego jest zweryfikowanie hipotezy o możliwości 
wykorzystania PLC jako platformy implementacji zaawansowanych algorytmów 
sterowania przez opracowanie:
1. Zestawu testów wydajności obliczeniowej PLC znanych z PC. Na podstawie 
wyników tych testów można dokonać oceny możliwości implementacji (lub zakresu 
stosowalności) poszczególnych algorytmów
2. Opracowania efektywnych algorytmów dzielenia kodu pomiędzy cykle PLC
3. Zbudowania biblioteki zaawansowanych algorytmów:
  * Filtracji
  * Estymacji
  * Sterowania
  * Optymalizacji (opcjonalnie)
5. Zastosowanie i zweryfikowanie opracowanej biblioteki z użyciem symulatorów i 
obiektów rzeczywistych w postaci stanowisk laboratoryjnych
6. Zamieszczenie opracowanego oprogramowania w postaci repozytorium GitHub
7. Opracowanie publikacji dokumentującej prace i otrzymane efekty w ramach 
projektu.
