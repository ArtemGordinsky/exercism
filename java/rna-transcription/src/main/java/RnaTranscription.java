import java.util.Map;
import java.util.stream.Collectors;

import static java.util.Map.entry;

class RnaTranscription {

    private static final Map<Character, String> dnaToRna = Map.ofEntries(
        entry('G', "C"),
        entry('C', "G"),
        entry('T', "A"),
        entry('A', "U")
    );

    String transcribe(String dnaStrand) {
        return dnaStrand.chars()
            .mapToObj(nucleotide -> dnaToRna.get((char) nucleotide))
            .collect(Collectors.joining());
    }
}