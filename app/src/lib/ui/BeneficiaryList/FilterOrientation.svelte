<script lang="ts">
	import { createEventDispatcher } from 'svelte';
	import { Checkbox, Select } from '$lib/ui/base';
	import type { BeneficiaryFilter, OrientedFilter } from './OrientationFilter';

	export let orientationStatusFilter: string;
	export let withoutOrientationManager: boolean;
	export let beneficiaryFilter: string;
	export let search: string;

	const dispatch = createEventDispatcher();

	let orientationStatusfilterOptions: { label: string; name: OrientedFilter }[] = [
		{ label: 'À orienter', name: 'non-oriente' },
		{ label: 'Orienté', name: 'oriente' },
	];

	let beneficiaryFromfilterOptions: { label: string; name: BeneficiaryFilter }[] = [
		{ label: 'Bénéficiaires de mon portefeuille', name: 'mes-beneficiaires' },
		{ label: 'Autres bénéficiaires du territoire', name: 'autres-beneficiaires' },
	];

	function onSubmit() {
		dispatch('filter-update', {
			orientationStatusFilter,
			withoutOrientationManager,
			beneficiaryFilter,
			search: search.trim(),
		});
	}
	function updateFilters() {
		dispatch('filter-update', {
			orientationStatusFilter,
			withoutOrientationManager,
			beneficiaryFilter,
			search: search.trim(),
		});
	}
</script>

<form on:submit|preventDefault={onSubmit}>
	<div class="flex items-end justify-between">
		<div class="flex gap-4">
			<Select
				bind:selected={beneficiaryFilter}
				on:select={updateFilters}
				options={beneficiaryFromfilterOptions}
				selectLabel="Bénéficiaires"
				classNames="!mb-0"
				name="beneficiaryFrom"
			/>
			<Select
				bind:selected={orientationStatusFilter}
				on:select={updateFilters}
				options={orientationStatusfilterOptions}
				selectLabel="Statut"
				classNames="!mb-0"
				name="orientationStatusFilter"
			/>
		</div>

		<div class="fr-search-bar" role="search">
			<label class="fr-label sr-only" for="search-beneficiary-input">
				Rechercher des beneficiaire
			</label>
			<input
				class="fr-input"
				placeholder="Nom de famille"
				type="search"
				id="search-beneficiary-input"
				name="search"
				bind:value={search}
			/>
			<button class="fr-btn"> Rechercher </button>
		</div>
	</div>

	<p class="flex items-center gap-4 font-medium fr-mt-2w">
		<Checkbox
			disabled={beneficiaryFilter == 'mes-beneficiaires'}
			label="Bénéficiaires non pris en charge par un chargé d'orientation"
			name="hasOrientationManager"
			bind:checked={withoutOrientationManager}
			on:change={updateFilters}
		/>
	</p>
</form>
