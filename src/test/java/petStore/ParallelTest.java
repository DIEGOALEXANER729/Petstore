package petStore;

import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;

public class ParallelTest {

    @Test
    void testParallel(){
        Runner.path("classpath:petStore").parallel(4);
    }
}
