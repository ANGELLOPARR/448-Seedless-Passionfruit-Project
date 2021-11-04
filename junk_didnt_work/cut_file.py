with open('Dataset1_Complete_MS.vcf', 'r') as f:
    with open('short_data.vcf', 'w') as out:
        for i in range(250):
            out.write(f.readline())


