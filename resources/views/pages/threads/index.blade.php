<x-guest-layout>
    <main class="wrapper">
        <section class="grid grid-cols-4 gap-8 mt-8">


            {{-- SIDE NAV --}}
            <x-partials.sidenav />

            <div class="flex flex-col col-span-3 gap-y-4">
            {{-- Alert --}}
            <x-alerts.main />
            @foreach ($threads as $thread)
                <x-thread :thread="$thread" />
            @endforeach


                {{-- PAGINATION --}}
                <div class="mt-5">
                    {{ $threads->render() }}
                </div>
                
            </div>

            
        </section>
    </main>
</x-guest-layout>
