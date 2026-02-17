#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

params.scripts_dir = "$projectDir"  // You can override this with --scripts_dir option

process DO_A {
    publishDir params.scripts_dir, mode: 'copy', pattern: '*.txt'
    
    input:
    path script

    output:
    path '*.txt', emit: a_output

    script:
    """
    bash $script
    """
}

process DO_B {
    publishDir params.scripts_dir, mode: 'copy', pattern: '*.txt'
    
    input:
    path script

    output:
    path '*.txt', emit: b_output

    script:
    """
    bash $script
    """
}

process DO_C {
    publishDir params.scripts_dir, mode: 'copy', pattern: '*.txt'

    input:
    path script
    val a_done
    val b_done

    output:
    path '*.txt', optional: true, emit: c_output

    script:
    """
    cd ${params.scripts_dir}
    echo "Current directory: \$(pwd)"
    echo "Contents of current directory:"
    ls -la *.txt
    echo "Executing: bash $script"
    bash $script
    echo "After execution, contents of current directory:"
    ls -la *.txt
    
    # Copy any new .txt files back to the work directory
    find . -type f -name "*.txt" -newer $script -exec cp {} . \\;
    """
}

workflow {
    do_a_script = file("${params.scripts_dir}/do_a.sh")
    do_b_script = file("${params.scripts_dir}/do_b.sh")
    do_c_script = file("${params.scripts_dir}/do_c.sh")

    a_result = DO_A(do_a_script)
    b_result = DO_B(do_b_script)
    DO_C(do_c_script, a_result.a_output, b_result.b_output)
}
